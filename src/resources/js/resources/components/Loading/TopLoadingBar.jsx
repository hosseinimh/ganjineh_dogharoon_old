import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import LoadingBar from "react-top-loading-bar";

const TopLoadingBar = () => {
    const layoutState = useSelector((state) => state.layoutReducer);
    const [progress, setProgress] = useState(0);
    const [loadingInterval, setLoadingInterval] = useState(null);

    useEffect(() => {
        if (layoutState?.loading && !loadingInterval) {
            loading();
        }

        if (!layoutState?.loading) {
            clearInterval(loadingInterval);
            setLoadingInterval(null);
        }
    }, [layoutState?.loading]);

    useEffect(() => {
        if (progress === 100) {
            restart();
        }
    }, [progress]);

    useEffect(() => {
        if (layoutState?.loading && !loadingInterval) {
            loading();
        }
    }, [loadingInterval]);

    const restart = () => {
        clearInterval(loadingInterval);
        setLoadingInterval(null);
        setProgress(0);
    };

    const loading = () => {
        setProgress(0);
        setLoadingInterval(
            setInterval(() => {
                setProgress((progress) =>
                    progress < 100 ? progress + 1 : 100
                );
            }, 20)
        );
    };

    useEffect(() => {
        return () => {
            clearInterval(loadingInterval);
        };
    }, []);

    if (layoutState?.loading && progress > 0) {
        return (
            <LoadingBar
                color="#2998ff"
                progress={progress}
                height={2}
                shadow={false}
            />
        );
    }

    return <></>;
};

export default TopLoadingBar;
