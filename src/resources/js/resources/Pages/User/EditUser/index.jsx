import React from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import {
    InputRadioColumn,
    InputTextColumn,
    FormPage,
    InputCheckboxColumn,
} from "../../../components";
import * as funcs from "./funcs";
import { editUserPage as strings } from "../../../../constants/strings";
import { editUserSchema as schema } from "../../../validations";
import utils from "../../../../utils/Utils";

const EditUser = () => {
    const lsUser = utils.getLSUser();
    const layoutState = useSelector((state) => state.layoutReducer);
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <FormPage
            page={
                !layoutState?.pageProps?.userId
                    ? null
                    : layoutState?.pageProps?.userId == lsUser?.id
                    ? "EditProfile"
                    : "Users"
            }
            strings={strings}
            funcs={funcs}
            useForm={form}
        >
            <InputTextColumn field="name" />
            <InputTextColumn field="family" />
            <InputTextColumn
                type="number"
                field="mobile"
                inputStyle={{ textAlign: "left" }}
            />
            <div className="col-md-3 col-sm-12 pb-4">
                <label className="form-label">{strings.status}</label>
                <InputCheckboxColumn field="isActive" checked={true} />
            </div>
            <div className="col-md-3 col-sm-12 pb-4">
                <label className="form-label">{strings.type}</label>
                <InputRadioColumn field="administrator" name="type" />
                <InputRadioColumn field="user" name="type" />
            </div>
        </FormPage>
    );
};

export default EditUser;
