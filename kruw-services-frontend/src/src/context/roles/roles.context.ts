import { createContext } from "react";
import { IRoles, RolesState } from "src/interfaces";

export type RolesContextProps = {
  rolesState: RolesState;
  setRoles: (roles: IRoles[]) => void;
};

export const RolesContext = createContext<RolesContextProps>(
  {} as RolesContextProps
);
