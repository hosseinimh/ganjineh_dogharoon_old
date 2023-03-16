import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { addBankPage as strings } from "../../../../constants/strings";
import { addBankSchema as schema } from "../../../validations";

const AddBank = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage page={"Banks"} strings={strings} funcs={funcs} useForm={form}>
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default AddBank;
