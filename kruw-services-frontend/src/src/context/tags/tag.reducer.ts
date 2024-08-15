import { IDevice, ITag, TagState } from "src/interfaces";

type TagAction =
  | { type: "toggleRefresh" }
  | { type: "setTags"; payload: ITag[] }
  | { type: "setDevices"; payload: IDevice[] }
  | { type: "setTagActive"; payload: ITag | null }
  | { type: "setDeviceActive"; payload: IDevice | null }
  | { type: "setTotal"; payload: number }
  | { type: "setTotalPages"; payload: number };

export const tagReducer = (state: TagState, action: TagAction): TagState => {
  switch (action.type) {
    case "setTags":
      return {
        ...state,
        tags: [...action.payload],
      };
    case "setDevices":
      return {
        ...state,
        devices: [...action.payload],
      };
    case "setTotal":
      return {
        ...state,
        total: action.payload,
      };
    case "setTagActive":
      return {
        ...state,
        tagActive: action.payload ? { ...action.payload } : null,
      };
    case "setDeviceActive":
      return {
        ...state,
        deviceActive: action.payload ? { ...action.payload } : null,
      };
    case "setTotalPages":
      return {
        ...state,
        total_pages: action.payload,
      };
    case "toggleRefresh":
      return {
        ...state,
        refresh: !state.refresh,
      };
    default:
      return state;
  }
};
