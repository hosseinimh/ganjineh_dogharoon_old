import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";

import { BASE_PATH, MESSAGE_CODES, MESSAGE_TYPES } from "../../../constants";
import {
    setPageAction,
    setLoadingAction,
    setPagePropsAction,
} from "../../../state/layout/layoutActions";
import {
    clearMessageAction,
    setMessageAction,
    setRenderMessageAction,
} from "../../../state/message/messageActions";
import { clearLogoutAction } from "../../../state/user/userActions";
import utils from "../../../utils/Utils";
import { Footer, Header, Sidebar } from "../../components";

const BasePageLayout = ({
    page,
    strings,
    funcs,
    useForm,
    children,
    authPage = true,
    modals,
}) => {
    const dispatch = useDispatch();
    const navigate = useNavigate();
    const layoutState = useSelector((state) => state.layoutReducer);
    const ms = useSelector((state) => state.messageReducer);
    const userState = useSelector((state) => state.userReducer);
    const [params, setParams] = useState({});
    const newParams = useParams();

    if (JSON.stringify(params) !== JSON.stringify(newParams)) {
        setParams(newParams);
    }

    useEffect(() => {
        funcs?.onLoad(params);
    }, [params]);

    funcs?.init(dispatch, navigate, useForm);

    useEffect(() => {
        funcs?.onLayoutState();
    }, [layoutState]);

    useEffect(() => {
        if (userState?.error) {
            dispatch(setLoadingAction(false));
            dispatch(
                setMessageAction(
                    userState?.error,
                    MESSAGE_TYPES.ERROR,
                    MESSAGE_CODES.FORM_INPUT_INVALID
                )
            );
        }
    }, [userState]);

    useEffect(() => {
        if (
            typeof useForm?.formState?.errors === "object" &&
            useForm.formState.errors
        ) {
            const hasKeys = !!Object.keys(useForm.formState.errors).length;

            if (hasKeys) {
                dispatch(
                    setMessageAction(
                        useForm.formState.errors[
                            Object.keys(useForm.formState.errors)[0]
                        ].message,
                        MESSAGE_TYPES.ERROR,
                        MESSAGE_CODES.FORM_INPUT_INVALID,
                        true,
                        Object.keys(useForm.formState.errors)[0]
                    )
                );
            }
        }
    }, [useForm?.formState?.errors]);

    useEffect(() => {
        window.scrollTo(0, 0);

        const user = utils.getLSUser();

        if ((authPage && !user) || (!authPage && user)) {
            dispatch(clearLogoutAction());
            navigate(`${BASE_PATH}/users/login`);

            return;
        }

        dispatch(setPageAction(page));
        dispatch(setPagePropsAction({ strings, useForm }));
        dispatch(setRenderMessageAction());

        if (ms?.messageField || ms?.messageRender) {
            dispatch(clearMessageAction());
        }

        loadModals();
    }, []);

    const loadModals = () => {
        let modalObjs = [];

        modals?.map((modal) => {
            const modalElement = document.getElementById(modal.id);
            const m = modalElement ? new coreui.Modal(modalElement) : null;
            const form = modal?.useForm;

            modalElement?.addEventListener("hidden.coreui.modal", () => {
                dispatch(
                    setPagePropsAction({
                        item: null,
                        action: null,
                    })
                );
                dispatch(clearMessageAction());
                form?.reset();
            });

            modalObjs = [{ modal: m, form }, ...modalObjs];
        });

        if (funcs?.loadModals instanceof Function) {
            funcs.loadModals(modalObjs);
        }
    };

    return (
        <>
            <div
                className={`app-container app-theme-white body-tabs-shadow${
                    userState.isAuthenticated
                        ? " fixed-header fixed-sidebar"
                        : ""
                }`}
            >
                {userState.isAuthenticated && <Header />}
                {userState.isAuthenticated && (
                    <div className="app-main">
                        <Sidebar />
                        <div className="app-main__outer">
                            <div className="app-main__inner">
                                <div className="app-page-title">
                                    <div className="page-title-wrapper">
                                        <div className="page-title-heading">
                                            <div className="page-title-icon">
                                                <i className="pe-7s-phone icon-gradient bg-premium-dark"></i>
                                            </div>
                                            <div>
                                                {layoutState?.title}
                                                <div className="page-title-subheading">
                                                    {layoutState?.subTitle}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                {children}
                            </div>
                            <Footer />
                        </div>
                    </div>
                )}
                {!userState.isAuthenticated && { ...children }}
            </div>
        </>
    );
};

export default BasePageLayout;
