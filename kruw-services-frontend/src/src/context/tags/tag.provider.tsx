import { useReducer } from "react";
import { IDevice, ITag, TagState } from "src/interfaces";
import { TagContext } from "./tag.context";
import { tagReducer } from "./tag.reducer";

const INITIAL_STATE: TagState = {
  tags: [],
  devices: [],
  tagActive: null,
  deviceActive: null,
  total: 0,
  total_pages: 1,
  refresh: false,
};

interface Props {
  children: JSX.Element | JSX.Element[];
}

export const TagProvider = ({ children }: Props) => {
  const [tagState, dispatch] = useReducer(tagReducer, INITIAL_STATE);

  const setTags = (tags: ITag[]) => {
    dispatch({ type: "setTags", payload: tags });
  };

  const setDevices = (devices: IDevice[]) => {
    dispatch({ type: "setDevices", payload: devices });
  };

  const setTagActive = (tag: ITag | null) => {
    dispatch({ type: "setTagActive", payload: tag });
  };

  const setDeviceActive = (device: IDevice | null) => {
    dispatch({ type: "setDeviceActive", payload: device });
  };

  const setTotal = (total: number) => {
    dispatch({ type: "setTotal", payload: total });
  };

  const setTotalPages = (pages: number) => {
    dispatch({ type: "setTotalPages", payload: pages });
  };

  const toggleRefresh = () => {
    dispatch({ type: "toggleRefresh" });
  };

  return (
    <TagContext.Provider
      value={{
        setTags,
        setDevices,
        setTotal,
        setTagActive,
        setDeviceActive,
        setTotalPages,
        toggleRefresh,
        tagState,
      }}
    >
      {children}
    </TagContext.Provider>
  );
};
