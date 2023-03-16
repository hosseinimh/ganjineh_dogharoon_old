import React from "react";
import { useSelector } from "react-redux";

import { banksPage as strings, general } from "../../../../constants/strings";
import * as funcs from "./funcs";
import { ListPage, TableItems } from "../../../components";
import utils from "../../../../utils/Utils";

const Banks = () => {
    const layoutState = useSelector((state) => state.layoutReducer);
    const columnsCount = 2;

    const renderHeader = () => (
        <tr>
            <th scope="col" style={{ width: "50px" }}>
                #
            </th>
            <th scope="col">{strings.name}</th>
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

    return (
        <ListPage
            page={"Banks"}
            strings={strings}
            table={{ renderHeader, renderItems }}
            funcs={funcs}
        ></ListPage>
    );
};

export default Banks;