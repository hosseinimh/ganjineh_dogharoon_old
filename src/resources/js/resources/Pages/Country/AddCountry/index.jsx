import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { addCountryPage as strings } from "../../../../constants/strings";
import { addCountrySchema as schema } from "../../../validations";

const AddCountry = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage page={"Countries"} strings={strings} funcs={funcs} useForm={form}>
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default AddCountry;
