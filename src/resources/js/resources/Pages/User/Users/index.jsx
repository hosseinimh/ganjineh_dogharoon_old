import React from "react";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";

import { usersPage as strings, general } from "../../../../constants/strings";
import * as funcs from "./funcs";
import {
    InputTextColumn,
    ListPage,
    SearchBox,
    TableFooter,
    TableItems,
} from "../../../components";
import utils from "../../../../utils/Utils";
import { USER_ROLES } from "../../../../constants";
import { searchUserSchema as schema } from "../../../validations";

const Users = () => {
    const layoutState = useSelector((state) => state.layoutReducer);
    const columnsCount = 5;
    const form = useForm({
        resolver: yupResolver(schema),
    });

    const renderSearch = () => (
        <div className="row">
            <InputTextColumn
                field="username"
                inputStyle={{
                    textAlign: "left",
                }}
            />
            <InputTextColumn field="nameFamily" />
        </div>
    );

    const renderHeader = () => (
        <tr>
            <th scope="col" style={{ width: "50px" }}>
                #
            </th>
            <th scope="col" style={{ width: "150px" }}>
                {strings.username}
            </th>
            <th scope="col">{strings.nameFamily}</th>
            <th scope="col" style={{ width: "150px" }}>
                {strings.role}
            </th>
            <th scope="col" style={{ width: "100px" }}>
                {strings.status}
            </th>
        </tr>
    );

    const renderItems = () => {
        const children = layoutState?.pageProps?.items?.map((item, index) => (
            <React.Fragment key={item.id}>
                <tr>
                    <td scope="row">
                        {utils.en2faDigits(
                            (layoutState?.pageProps?.pageNumber - 1) * 10 +
                                index +
                                1
                        )}
                    </td>
                    <td>{item.username}</td>
                    <td>{`${item.name} ${item.family}`}</td>
                    <td>
                        {item.role === USER_ROLES.ADMINISTRATOR
                            ? general.administrator
                            : general.user}
                    </td>
                    <td>
                        {item.isActive === 1
                            ? strings.active
                            : strings.notActive}
                    </td>
                </tr>
                <tr>
                    <td colSpan={columnsCount}>
                        <button
                            type="button"
                            className="btn btn-warning mb-2 px-4 ml-2"
                            onClick={() => funcs.onEdit(item)}
                            title={general.edit}
                            disabled={layoutState?.loading}
                        >
                            {general.edit}
                        </button>
                        <button
                            type="button"
                            className="btn btn-secondary mb-2 px-4 ml-2"
                            onClick={() => funcs.onChangePassword(item)}
                            title={strings.changePassword}
                            disabled={layoutState?.loading}
                        >
                            {strings.changePassword}
                        </button>
                    </td>
                </tr>
            </React.Fragment>
        ));

        return <TableItems columnsCount={columnsCount} children={children} />;
    };

    const renderFooter = () => (
        <TableFooter columnsCount={columnsCount} funcs={funcs} />
    );

    return (
        <ListPage
            page={"Users"}
            strings={strings}
            useForm={form}
            table={{ renderHeader, renderItems, renderFooter }}
            funcs={funcs}
            hasAdd={lsUser.role === USER_ROLES.ADMINISTRATOR ? true : false}
        >
            <SearchBox useForm={form} onSubmit={funcs.onSubmit}>
                {renderSearch()}
            </SearchBox>
        </ListPage>
    );
};

export default Users;
