import React from "react";
import { useSelector } from "react-redux";

import {
    villagesPage as strings,
    general,
    districts,
} from "../../../../constants/strings";
import * as funcs from "./funcs";
import { ListPage, TableFooter, TableItems } from "../../../components";
import utils from "../../../../utils/Utils";
import { USER_ROLES } from "../../../../constants";

export const districtItems = [
    { value: 1, label: districts.district1 },
    { value: 2, label: districts.district2 },
];

const Villages = () => {
    const lsUser = utils.getLSUser();
    const layoutState = useSelector((state) => state.layoutReducer);
    const columnsCount = 3;

    const renderHeader = () => (
        <tr>
            <th scope="col" style={{ width: "50px" }}>
                #
            </th>
            <th scope="col">{strings.name}</th>
            <th scope="col" style={{ width: "150px" }}>
                {strings.district}
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
                    <td>{item.name}</td>
                    <td>{item.districtName}</td>
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
            page={"Villages"}
            strings={strings}
            table={{ renderHeader, renderItems, renderFooter }}
            funcs={funcs}
            hasAdd={lsUser.role === USER_ROLES.ADMINISTRATOR ? true : false}
        ></ListPage>
    );
};

export default Villages;
