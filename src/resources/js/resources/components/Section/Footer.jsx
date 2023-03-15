import React from "react";
import { useSelector } from "react-redux";

import { footer as strings, general } from "../../../constants/strings";

const Footer = () => {
    const ls = useSelector((state) => state.layoutReducer);

    return (
        <>
            <div className="app-footer">
                <div className="app-footer__inner">
                    <div className="app-footer-left">
                        <ul className="nav">
                            <li className="nav-item">
                                <a href="#" className="nav-link">
                                    Footer Link 1
                                </a>
                            </li>
                            <li className="nav-item">
                                <a href="#" className="nav-link">
                                    Footer Link 2
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div className="app-footer-right">
                        <ul className="nav">
                            <li className="nav-item">
                                <a href="#" className="nav-link">
                                    Footer Link 3
                                </a>
                            </li>
                            <li className="nav-item">
                                <a href="#" className="nav-link">
                                    <div className="badge badge-success mr-1 ml-0">
                                        <small>NEW</small>
                                    </div>
                                    Footer Link 4
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div
                className="loading-wrapper"
                style={{
                    display: ls?.loading ? "flex" : "none",
                }}
            >
                <div className="loading"></div>
                <p>{general.loading}</p>
            </div>
        </>
    );
};

export default Footer;
