import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import PerfectScrollbar from "perfect-scrollbar";
import { slideUp, slideDown } from "es6-slide-up-down";
import { easeOutQuint } from "es6-easings";

import { BASE_PATH } from "../../../constants";
import { sidebar as strings } from "../../../constants/strings";
import { fetchLogoutAction } from "../../../state/user/userActions";
import { CustomLink } from "../";

function Sidebar() {
    const dispatch = useDispatch();
    const layoutState = useSelector((state) => state.layoutReducer);
    const [page, setPage] = useState(null);

    useEffect(() => {
        setPage(layoutState?.page);
    }, [layoutState]);

    useEffect(() => {
        if (page) {
            selectPage();
        }
    }, [page]);

    useEffect(() => {
        const container = document.querySelector(".scrollbar-sidebar");
        new PerfectScrollbar(container);
        initSidebarMenus();
        onPageLoad();
    }, []);

    const findSidebarBtn = (e, isMobile) => {
        e.preventDefault();

        let element;

        if (isMobile) {
            if (e.target.classList.contains("mobile-toggle-nav")) {
                element = e.target;
            } else if (e.target.classList.contains("hamburger-box")) {
                element = e.target.parentNode;
            } else if (e.target.classList.contains("hamburger-inner")) {
                element = e.target.parentNode.parentNode;
            }
        } else {
            if (e.target.classList.contains("close-sidebar-btn")) {
                element = e.target;
            } else if (e.target.classList.contains("hamburger-box")) {
                element = e.target.parentNode;
            } else if (e.target.classList.contains("hamburger-inner")) {
                element = e.target.parentNode.parentNode;
            }
        }

        return element;
    };

    const findDropDownLink = (e, isMobile) => {
        e.preventDefault();

        let element;

        if (isMobile) {
            if (
                e.target.classList.contains("btn-sm mobile-toggle-header-nav")
            ) {
                element = e.target;
            } else if (e.target.classList.contains("btn-icon-wrapper")) {
                element = e.target.parentNode;
            } else if (e.target.classList.contains("fa-ellipsis-v")) {
                element = e.target.parentNode.parentNode;
            }
        } else {
            if (e.target.getAttribute("data-toggle")) {
                element = e.target;
            } else if (e.target.classList.contains("rounded-circle")) {
                element = e.target.parentNode;
            } else if (e.target.classList.contains("fa-angle-down")) {
                element = e.target.parentNode;
            }
        }

        return element;
    };

    const toggleSidebar = (element) => {
        if (!element) {
            return;
        }

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

    const toggleDropDown = (element) => {
        if (!element) {
            return;
        }

        if (document.body.clientWidth < 992) {
            const appHeader = document.querySelector(".app-header__content");
            const popup = document.querySelector(".dropdown-menu-left");
            const btnGroup = popup.parentNode;
            if (appHeader.classList.contains("header-mobile-open")) {
                appHeader.classList.remove("header-mobile-open");
                btnGroup.classList.remove("show");
                element.classList.remove("active");
                popup.classList.remove("show");
                popup.removeAttribute("x-placement");
                popup.style = "";
            } else {
                appHeader.classList.add("header-mobile-open");
                btnGroup.classList.add("show");
                element.classList.add("active");
                popup.classList.add("show");
                popup.setAttribute("x-placement", "bottom-start");
                popup.style =
                    "position: absolute; transform: translate3d(-16px, 44px, 0px); top: 0px; left: 0px; will-change: transform;";
            }
        } else {
            const btnGroup = element.parentNode;
            const popup = element.nextElementSibling;
            if (btnGroup.classList.contains("show")) {
                btnGroup.classList.remove("show");
                element.setAttribute("aria-expanded", "false");
                popup.classList.remove("show");
                popup.removeAttribute("x-placement");
                popup.style = "";
            } else {
                btnGroup.classList.add("show");
                element.setAttribute("aria-expanded", "true");
                popup.classList.add("show");
                popup.setAttribute("x-placement", "bottom-start");
                popup.style =
                    "position: absolute; transform: translate3d(0px, 44px, 0px); top: 0px; left: 0px; will-change: transform;";
            }
        }
    };

    const initSidebarMenus = () => {
        const links = [...document.querySelectorAll(".menu-container")];

        links.forEach((link) => {
            link.addEventListener("click", (e) => {
                e.preventDefault();
                const parent = link.parentNode;
                if (parent.classList.contains("mm-active")) {
                    parent.classList.remove("mm-active");
                    link.setAttribute("aria-expanded", "false");
                    link.classList.remove("mb-1");
                    slideUp(link.nextElementSibling);
                } else {
                    parent.classList.add("mm-active");
                    link.setAttribute("aria-expanded", "true");
                    link.classList.add("mb-1");
                    slideDown(link.nextElementSibling, {
                        duration: 400,
                        easing: easeOutQuint,
                    });
                }
            });
        });
    };

    const selectPage = () => {
        const links = [...document.querySelectorAll("[datapage")];
        let link = links.filter((l) => l.getAttribute("datapage") === page);
        link = link.length > 0 ? link[0] : null;
        link.firstChild.classList.add("mm-active");
        if (link.parentNode.classList.contains("mm-collapse")) {
            link.parentNode.style = "display:block;";
        }
        if (link.parentNode.parentNode.nodeName === "LI") {
            link.parentNode.parentNode.classList.add("mm-active");
        }
    };

    const onPageLoad = () => {
        document
            .querySelector(".close-sidebar-btn")
            ?.addEventListener("click", (e) => {
                const isMobile = document.body.clientWidth < 1250;
                toggleSidebar(findSidebarBtn(e, isMobile));
            });
        document
            .querySelector(".mobile-toggle-nav")
            ?.addEventListener("click", (e) => {
                const isMobile = document.body.clientWidth < 1250;
                toggleSidebar(findSidebarBtn(e, isMobile));
            });
        document
            .querySelector("[data-toggle]")
            ?.addEventListener("click", (e) => {
                const isMobile = document.body.clientWidth < 992;
                toggleDropDown(findDropDownLink(e, isMobile));
            });
        document
            .querySelector(".mobile-toggle-header-nav")
            ?.addEventListener("click", (e) => {
                const isMobile = document.body.clientWidth < 992;
                toggleDropDown(findDropDownLink(e, isMobile));
            });

        const container = document.querySelector(".app-container");

        if (document.body.clientWidth < 1250) {
            container.classList.add("closed-sidebar-mobile");
            container.classList.add("closed-sidebar");
        } else {
            container.classList.remove("closed-sidebar-mobile");
            container.classList.remove("closed-sidebar");
        }
    };

    const onLogout = () => {
        dispatch(fetchLogoutAction());
    };

    const renderMenuItem = (url, string, icon, page) => (
        <li datapage={page}>
            <Link to={url} aria-expanded="false">
                <i className={`metismenu-icon ${icon}`}></i>
                {string}
            </Link>
        </li>
    );

    const renderSubMenuItem = (url, string, page) => (
        <li datapage={page}>
            <Link to={url} aria-expanded="false">
                <i className="metismenu-icon"></i>
                {string}
            </Link>
        </li>
    );

    return (
        <div className="app-sidebar sidebar-text-light sidebar-shadow bg-royal">
            <div className="app-header__logo">
                <div className="logo-src"></div>
                <div className="header__pane ml-auto">
                    <div>
                        <button
                            type="button"
                            className="hamburger close-sidebar-btn hamburger--elastic"
                        >
                            <span className="hamburger-box">
                                <span className="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
            <div className="app-header__mobile-menu">
                <div>
                    <button
                        type="button"
                        className="hamburger hamburger--elastic mobile-toggle-nav"
                    >
                        <span className="hamburger-box">
                            <span className="hamburger-inner"></span>
                        </span>
                    </button>
                </div>
            </div>
            <div className="app-header__menu">
                <span>
                    <button
                        type="button"
                        className="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav"
                    >
                        <span className="btn-icon-wrapper">
                            <i className="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
            </div>
            <div className="scrollbar-sidebar ps ps--active-y">
                <div className="app-sidebar__inner">
                    <ul className="vertical-nav-menu metismenu">
                        <li className="app-sidebar__heading">
                            {strings.mainContainer}
                        </li>
                        {renderMenuItem(
                            `${BASE_PATH}`,
                            strings.dashboard,
                            "pe-7s-rocket",
                            "Dashboard"
                        )}
                        <li className="app-sidebar__heading">
                            {strings.servicesContainer}
                        </li>
                        <li>
                            <a
                                href="#"
                                aria-expanded="false"
                                className="menu-container"
                            >
                                <i className="metismenu-icon pe-7s-news-paper"></i>
                                {strings.baseInformation}
                                <i className="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                            </a>
                            <ul className="mm-collapse">
                                {renderSubMenuItem(
                                    `${BASE_PATH}/villages`,
                                    strings.villages,
                                    "Villages"
                                )}
                                {renderSubMenuItem(
                                    `${BASE_PATH}/banks`,
                                    strings.banks,
                                    "Banks"
                                )}
                                {renderSubMenuItem(
                                    `${BASE_PATH}/relationships`,
                                    strings.relationships,
                                    "Relationships"
                                )}
                                {renderSubMenuItem(
                                    `${BASE_PATH}/countries`,
                                    strings.countries,
                                    "Countries"
                                )}
                            </ul>
                        </li>
                        <li>
                            <a
                                href="#"
                                aria-expanded="false"
                                className="menu-container"
                            >
                                <i className="metismenu-icon pe-7s-config"></i>
                                {strings.systemManagement}
                                <i className="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                            </a>
                            <ul className="mm-collapse">
                                {renderSubMenuItem(
                                    `${BASE_PATH}/users`,
                                    strings.users,
                                    "Users"
                                )}
                            </ul>
                        </li>
                        <li className="app-sidebar__heading">
                            {strings.userContainer}
                        </li>
                        {renderMenuItem(
                            `${BASE_PATH}/users/edit`,
                            strings.editProfile,
                            "pe-7s-id",
                            "EditProfile"
                        )}
                        {renderMenuItem(
                            `${BASE_PATH}/users/change_password`,
                            strings.changePassword,
                            "pe-7s-pen",
                            "ChangePasswordUser"
                        )}
                        <li>
                            <CustomLink
                                aria-expanded="false"
                                onClick={onLogout}
                            >
                                <i className="metismenu-icon pe-7s-door-lock"></i>
                                {strings.logout}
                            </CustomLink>
                        </li>
                    </ul>
                </div>
                <div
                    className="app-sidebar-bg opacity-06"
                    style={{
                        backgroundImage: 'url("/assets/images/menu-bg1.jpg")',
                    }}
                ></div>
            </div>
        </div>
    );
}

export default Sidebar;
