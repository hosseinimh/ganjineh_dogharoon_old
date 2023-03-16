import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, FormPage } from "../../../components";
import * as funcs from "./funcs";
import { editRelationshipPage as strings } from "../../../../constants/strings";
import { editRelationshipSchema as schema } from "../../../validations";

const EditRelationship = () => {
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

export default EditRelationship;
