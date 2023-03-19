import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { editCountryPage as strings } from "../../../../constants/strings";
import { editCountrySchema as schema } from "../../../validations";

const EditCountry = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage page={"Countries"} strings={strings} funcs={funcs} useForm={form}>
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default EditCountry;
