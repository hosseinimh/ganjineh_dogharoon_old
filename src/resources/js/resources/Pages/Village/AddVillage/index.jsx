import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import {
    InputTextColumn,
    FormPage,
    InputReactSelectColumn,
} from "../../../components";
import * as funcs from "./funcs";
import { addVillagePage as strings } from "../../../../constants/strings";
import { addVillageSchema as schema } from "../../../validations";
import { districtItems } from "../Villages";

const AddVillage = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage
            page={"Villages"}
            strings={strings}
            funcs={funcs}
            useForm={form}
        >
            <InputReactSelectColumn
                options={districtItems}
                field="district"
                handleChange={(value) => {
                    form.setValue("district", value);
                }}
            />
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default AddVillage;
