import React from "react";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { InputTextColumn, LoginPageLayout } from "../../../components";
import * as funcs from "./funcs";
import {
    loginUserPage as strings,
} from "../../../../constants/strings";
import { loginUserSchema as schema } from "../../../validations";

const LoginUser = () => {
    const form = useForm({
        resolver: yupResolver(schema),
    });

    return (
        <LoginPageLayout
            page={"Users"}
            strings={strings}
            useForm={form}
            funcs={funcs}
        >
            <form>
                <div className="form-row">
                    <div className="col-md-12">
                        <InputTextColumn
                            field="username"
                            showLabel={false}
                            inputStyle={{ direction: "ltr" }}
                        />
                    </div>
                    <div className="col-md-12">
                        <InputTextColumn
                            field="password"
                            type="password"
                            showLabel={false}
                            inputStyle={{ direction: "ltr" }}
                        />
                    </div>
                </div>
            </form>
        </LoginPageLayout>
    );
};

export default LoginUser;
