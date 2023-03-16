import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { addRelationshipPage as strings } from "../../../../constants/strings";
import { addRelationshipSchema as schema } from "../../../validations";

const AddRelationship = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage
            page={"Relationships"}
            strings={strings}
            funcs={funcs}
            useForm={form}
        >
            <InputTextColumn field="name" />
        </FormPage>
    );
};

export default AddRelationship;
