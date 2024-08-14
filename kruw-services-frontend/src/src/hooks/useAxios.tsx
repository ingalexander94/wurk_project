import { useContext, useEffect } from "react";
import { AxiosResponse } from "axios";
import { AxiosCall } from "src/interfaces";
import { AuthContext, UIContext } from "src/context";
import { CustomStorage } from "src/lib/Storage";
import * as error_messages from "src/data/errors.json";

const errors: any = error_messages;

const useAxios = () => {
  const { setToast } = useContext(UIContext);
  const { setUserAuth } = useContext(AuthContext);

  let controller: AbortController;

  const callEndpoint = async (axiosCall: AxiosCall<any>) => {
    if (axiosCall.controller) controller = axiosCall.controller;
    let result = {} as AxiosResponse<any>;
    try {
      result = await axiosCall.call;
    } catch (error: any) {
      if (![204].includes(error.response.status)) {
        const { data } = error.response;
        setToast({
          type: "error",
          title: "Error",
          message: errors[data.error],
          duration: 3000,
        });
      } else {
        CustomStorage.token = "";
        CustomStorage.removeToken();
        setUserAuth(null);
      }
      return null;
    }
    return result;
  };

  const cancelEndpoint = () => {
    controller && controller.abort();
  };

  useEffect(() => {
    return () => {
      cancelEndpoint();
    };
  }, []);

  return { callEndpoint };
};

export default useAxios;
