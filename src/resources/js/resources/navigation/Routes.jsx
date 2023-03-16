import React from "react";
import { useSelector } from "react-redux";
import { BrowserRouter as Router, Routes } from "react-router-dom";
import { Navigate, Route } from "react-router";

import * as Pages from "../Pages";
import utils from "../../utils/Utils";
import { BASE_PATH, USER_ROLES } from "../../constants";

function AuthRoute() {
    const us = useSelector((state) => state.userReducer);
    const lsUser = utils.getLSUser();

    return (
        <Router>
            {us.isAuthenticated && (
                <Routes>
                    {lsUser?.role === USER_ROLES.ADMINISTRATOR && (
                        <>
                            <Route
                                path={`${BASE_PATH}/villages/add`}
                                element={<Pages.AddVillage />}
                            />
                            <Route
                                path={`${BASE_PATH}/villages/edit/:villageId`}
                                element={<Pages.EditVillage />}
                            />
                            <Route
                                path={`${BASE_PATH}/banks/add`}
                                element={<Pages.AddBank />}
                            />
                            <Route
                                path={`${BASE_PATH}/banks/edit/:bankId`}
                                element={<Pages.EditBank />}
                            />
                            <Route
                                path={`${BASE_PATH}/users/change_password/:userId`}
                                element={<Pages.ChangePasswordUser />}
                            />
                            <Route
                                path={`${BASE_PATH}/users/add`}
                                element={<Pages.AddUser />}
                            />
                            <Route
                                path={`${BASE_PATH}/users/edit/:userId`}
                                element={<Pages.EditUser />}
                            />
                        </>
                    )}

                    {lsUser?.role === USER_ROLES.USER && <></>}

                    <Route
                        path={`${BASE_PATH}/villages`}
                        element={<Pages.Villages />}
                    />
                    <Route
                        path={`${BASE_PATH}/banks`}
                        element={<Pages.Banks />}
                    />
                    <Route
                        path={`${BASE_PATH}/users`}
                        element={<Pages.Users />}
                    />
                    <Route
                        path={`${BASE_PATH}`}
                        element={<Pages.Dashboard />}
                    />
                    <Route
                        path={`${BASE_PATH}/users/change_password`}
                        element={<Pages.ChangePasswordUser />}
                    />
                    <Route path="*" element={<Navigate to={BASE_PATH} />} />
                </Routes>
            )}
            {!us.isAuthenticated && (
                <Routes>
                    <Route
                        path={`${BASE_PATH}/users/login`}
                        exact={true}
                        element={<Pages.LoginUser />}
                    />
                    <Route
                        path="*"
                        element={<Navigate to={`${BASE_PATH}/users/login`} />}
                    />
                </Routes>
            )}
        </Router>
    );
}

export default AuthRoute;
