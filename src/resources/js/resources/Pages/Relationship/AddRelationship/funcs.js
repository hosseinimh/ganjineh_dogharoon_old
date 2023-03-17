import { Relationship as Entity } from "../../../../http/entities";
import { useSelector } from "react-redux";

import { addRelationshipPage as strings } from "../../../../constants/strings";
import {
    setLoadingAction,
    setPageIconAction,
    setPagePropsAction,
    setPageTitleAction,
} from "../../../../state/layout/layoutActions";
import {
    clearMessageAction,
    setMessageAction,
} from "../../../../state/message/messageActions";
import { BASE_PATH, MESSAGE_CODES, MESSAGE_TYPES } from "../../../../constants";

let _dispatch;
let _navigate;
let _ls;
let _pageProps;
let _callbackUrl;
let _entity = new Entity();

export const init = (dispatch, navigate) => {
    _dispatch = dispatch;
    _navigate = navigate;
    _ls = useSelector((state) => state.layoutReducer);

    _callbackUrl = `${BASE_PATH}/relationships`;
};

export const onLoad = (params) => {
    _pageProps = {
        action: null,
    };

    _dispatch(setPagePropsAction(_pageProps));
    _dispatch(setPageIconAction("pe-7s-news-paper"));
    _dispatch(setPageTitleAction(strings._title, strings._subTitle));
};

export const onLayoutState = () => {};

export const onSubmit = async (data) => {
    _dispatch(setLoadingAction(true));
    _dispatch(clearMessageAction());

    let result = await _entity.store(data.name);

    if (result === null) {
        _dispatch(setLoadingAction(false));
        _dispatch(
            setMessageAction(
                _entity.errorMessage,
                MESSAGE_TYPES.ERROR,
                _entity.errorCode
            )
        );

        return;
    }

    _dispatch(
        setMessageAction(
            strings.submitted,
            MESSAGE_TYPES.SUCCESS,
            MESSAGE_CODES.OK,
            false
        )
    );

    _navigate(_callbackUrl);
};

export const onCancel = () => {
    _navigate(_callbackUrl);
};
