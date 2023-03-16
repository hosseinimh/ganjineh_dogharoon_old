import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import {
    InputTextColumn,
    FormPage,
    InputSelectColumn,
} from "../../../components";
import * as funcs from "./funcs";
import {
    addVillagePage as strings,
    districts,
} from "../../../../constants/strings";
import { addVillageSchema as schema } from "../../../validations";

const districtItems = [
    { id: 1, value: districts.district1 },
    { id: 2, value: districts.district2 },
];

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
            <InputSelectColumn items={districtItems} field="district" />
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default AddVillage;
