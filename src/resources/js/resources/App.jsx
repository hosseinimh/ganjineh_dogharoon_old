import React from "react";
import { createRoot } from "react-dom/client";
import { Provider } from "react-redux";

import store from "../state/store";
import { Routes } from "./navigation";

function App() {
    return (
        <Provider store={store}>
            <Routes />
        </Provider>
    );
}

export default App;

if (document.getElementById("root")) {
    createRoot(document.getElementById("root")).render(<App />);
}
