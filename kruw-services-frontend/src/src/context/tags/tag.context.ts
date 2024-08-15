import { createContext } from "react";
import { IDevice, ITag, TagState } from "src/interfaces";

export type TagContextProps = {
  tagState: TagState;
  setTags: (tags: ITag[]) => void;
  setDevices: (devices: IDevice[]) => void;
  setTagActive: (device: ITag | null) => void;
  setDeviceActive: (devices: IDevice | null) => void;
  setTotal: (total: number) => void;
  setTotalPages: (pages: number) => void;
  toggleRefresh: () => void;
};

export const TagContext = createContext<TagContextProps>({} as TagContextProps);
