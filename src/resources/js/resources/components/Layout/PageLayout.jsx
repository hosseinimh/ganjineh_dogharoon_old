import React from "react";

import { AlertState } from "../../components";
import BasePageLayout from "./BasePageLayout";

const PageLayout = ({ children, page, strings, funcs, useForm }) => {
    return (
        <BasePageLayout
            page={page}
            strings={strings}
            funcs={funcs}
            useForm={useForm}
        >
            <div className="container-lg">
                <AlertState />
                {children}
            </div>
        </BasePageLayout>
    );
};

export default PageLayout;
