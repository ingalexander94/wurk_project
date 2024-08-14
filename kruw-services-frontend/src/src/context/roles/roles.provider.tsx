import { useReducer } from "react";
import { IRoles, RolesState } from "src/interfaces";
import { RolesContext } from "./roles.context";
import { rolesReducer } from "./roles.reducer";

const INITIAL_STATE: RolesState = {
  roles: [],
};

interface Props {
  children: JSX.Element | JSX.Element[];
}

export const RolesProvider = ({ children }: Props) => {
  const [rolesState, dispatch] = useReducer(rolesReducer, INITIAL_STATE);

  const setRoles = (roles: IRoles[]) => {
    dispatch({ type: "setRoles", payload: roles });
  };

  return (
    <RolesContext.Provider
      value={{
        setRoles,
        rolesState,
      }}
    >
      {children}
    </RolesContext.Provider>
  );
};
