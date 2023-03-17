import React from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import {
    InputTextColumn,
    FormPage,
    InputReactSelectColumn,
} from "../../../components";
import * as funcs from "./funcs";
import { editVillagePage as strings } from "../../../../constants/strings";
import { editVillageSchema as schema } from "../../../validations";
import { districtItems } from "../Villages";

const EditVillage = () => {
    const layoutState = useSelector((state) => state.layoutReducer);
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
                handleChange={(value) => form.setValue("district", value)}
                defaultValue={layoutState?.pageProps?.districtId}
            />
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default EditVillage;
