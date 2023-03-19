export const CHANGE_PAGE_ACTION = "CHANGE_PAGE_ACTION";
export const SET_PAGE_PROPS_ACTION = "SET_PAGE_PROPS_ACTION";
export const CHANGE_PAGE_TITLE_ACTION = "CHANGE_PAGE_TITLE_ACTION";
export const CHANGE_PAGE_ICON_ACTION = "CHANGE_PAGE_ICON_ACTION";
export const SET_LOADING_ACTION = "SET_LOADING_ACTION";
export const CLOSE_DROP_DOWN_ACTION = "CLOSE_DROP_DOWN_ACTION";

export const setPageAction = (page) => async (dispatch) => {
    dispatch({ type: CHANGE_PAGE_ACTION, payload: page });
};

export const setPagePropsAction = (pageProps) => async (dispatch) => {
    dispatch({ type: SET_PAGE_PROPS_ACTION, payload: pageProps });
};

export const setPageTitleAction = (title, subTitle) => async (dispatch) => {
    dispatch({
        type: CHANGE_PAGE_TITLE_ACTION,
        payload: { title, subTitle },
    });
};

export const setPageIconAction = (icon) => async (dispatch) => {
    dispatch({ type: CHANGE_PAGE_ICON_ACTION, payload: icon });
};

export const setLoadingAction = (loading) => async (dispatch) => {
    dispatch({
        type: SET_LOADING_ACTION,
        payload: loading,
    });
};

export const closeDropDownAction = (dropdowns) => async (dispatch) => {
    dispatch({
        type: CLOSE_DROP_DOWN_ACTION,
        payload: dropdowns,
    });
};
