import React from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { editBankPage as strings } from "../../../../constants/strings";
import { editBankSchema as schema } from "../../../validations";

const EditBank = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage page={"Banks"} strings={strings} funcs={funcs} useForm={form}>
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default EditBank;
