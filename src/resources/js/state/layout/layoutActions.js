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

export const toggleSidebarAction = (element) => async (dispatch) => {
    const container = document.querySelector(".app-container");

    if (element.classList.contains("is-active")) {
        element.classList.remove("is-active");
        if (document.body.clientWidth < 1250) {
            container.classList.remove("sidebar-mobile-open");
        } else {
            container.classList.remove("closed-sidebar");
        }
    } else {
        element.classList.add("is-active");
        if (document.body.clientWidth < 1250) {
            container.classList.add("sidebar-mobile-open");
        } else {
            container.classList.add("closed-sidebar");
        }
    }
};

export const toggleDropDownAction = (element) => async (dispatch) => {
    const popup = document.getElementsByClassName("user-popup")[0];
    if (document.body.clientWidth < 992) {
        const appHeader = document.querySelector(".app-header__content");
        if (element.classList.contains("active")) {
            element.classList.remove("active");
            appHeader.classList.remove("header-mobile-open");
            toggleDropDown(popup, false);
        } else {
            element.classList.add("active");
            appHeader.classList.add("header-mobile-open");
            toggleDropDown(popup, true);
        }
    } else {
        if (element.getAttribute("aria-expanded") === "true") {
            element.setAttribute("aria-expanded", "false");
            toggleDropDown(popup, false);
        } else {
            element.setAttribute("aria-expanded", "true");
            toggleDropDown(popup, true);
        }
    }
};

const toggleDropDown = (popup, show) => {
    const btnGroup = popup.parentNode;
    if (show) {
        btnGroup.classList.add("show");
        popup.classList.add("show");
        popup.setAttribute("x-placement", "bottom-start");
        if (document.body.clientWidth < 992) {
            popup.style =
                "position: absolute; transform: translate3d(2rem, 62px, 0px); top: 0px; left: 0px; will-change: transform;";
        } else {
            popup.style =
                "position: absolute; transform: translate3d(0px, 44px, 0px); top: 0px; left: 0px; will-change: transform;";
        }
    } else {
        btnGroup.classList.remove("show");
        popup.classList.remove("show");
        popup.removeAttribute("x-placement");
        popup.style = "";
    }
};

export const closeDropDownAction = (dropdowns) => async (dispatch) => {
    console.log("ss");
    dispatch({
        type: CLOSE_DROP_DOWN_ACTION,
        payload: dropdowns,
    });
};
