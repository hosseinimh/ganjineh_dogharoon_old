import { User as Entity } from "../../../../http/entities";

import {
    editUserPage as strings,
    general,
} from "../../../../constants/strings";
import {
    setLoadingAction,
    setPagePropsAction,
    setPageTitleAction,
} from "../../../../state/layout/layoutActions";
import {
    clearMessageAction,
    setMessageAction,
} from "../../../../state/message/messageActions";
import {
    BASE_PATH,
    MESSAGE_CODES,
    MESSAGE_TYPES,
    USER_ROLES,
} from "../../../../constants";
import utils from "../../../../utils/Utils";

let _dispatch;
let _navigate;
let _useForm;
let _pageProps;
let _callbackUrl;
let _userId;
const _lsUser = utils.getLSUser();
let _entity = new Entity();

export const init = (dispatch, navigate, useForm) => {
    _dispatch = dispatch;
    _navigate = navigate;
    _useForm = useForm;

    _callbackUrl = `${BASE_PATH}/users`;
};

export const onLoad = (params) => {
    _pageProps = {
        action: null,
    };

    setUserId(params?.userId);

    _dispatch(setPagePropsAction(_pageProps));
    _dispatch(setPageIconAction("pe-7s-user"));
    _dispatch(setPageTitleAction(strings._title));

    fillForm();
};

export const onLayoutState = () => {};

export const onSubmit = async (data) => {
    _dispatch(setLoadingAction(true));
    _dispatch(clearMessageAction());

    const role = data.administrator
        ? USER_ROLES.ADMINISTRATOR
        : USER_ROLES.USER;
    let result = await _entity.update(
        _userId,
        data.name,
        data.family,
        data.mobile,
        role,
        data.isActive ? 1 : 0
    );

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

const setUserId = (userId) => {
    _userId = !isNaN(userId) && userId > 0 ? userId : _lsUser.id;
};

const fillForm = async () => {
    _dispatch(setLoadingAction(true));

    await fetchPageData();

    _dispatch(setLoadingAction(false));
};

const fetchPageData = async () => {
    if (_userId <= 0) {
        _dispatch(
            setMessageAction(
                general.itemNotFound,
                MESSAGE_TYPES.ERROR,
                MESSAGE_CODES.ITEM_NOT_FOUND,
                false
            )
        );
        _dispatch(setLoadingAction(false));
        _navigate(_callbackUrl);

        return null;
    }

    let result =
        _lsUser.role === USER_ROLES.ADMINISTRATOR
            ? await _entity.getUser(_userId)
            : await _entity.getUserFromUser();

    if (result === null) {
        _dispatch(
            setMessageAction(
                general.itemNotFound,
                MESSAGE_TYPES.ERROR,
                MESSAGE_CODES.ITEM_NOT_FOUND,
                false
            )
        );
        _dispatch(setLoadingAction(false));
        _navigate(_callbackUrl);

        return null;
    }

    _useForm.setValue("name", result.item.name);
    _useForm.setValue("family", result.item.family);
    _useForm.setValue("mobile", result.item.mobile);
    _useForm.setValue("isActive", result.item.isActive);
    _useForm.setValue(
        result.item.role === USER_ROLES.ADMINISTRATOR
            ? "administrator"
            : "user",
        "on"
    );

    _dispatch(
        setPageTitleAction(
            `${strings._title} [ ${result.item.name} ${result.item.family} - ${result.item.username} ]`
        )
    );
    _dispatch(setLoadingAction(false));
};
