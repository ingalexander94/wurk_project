import { IRoles, RolesState } from "src/interfaces";

type RolesAction = { type: "setRoles"; payload: IRoles[] };

export const rolesReducer = (
  state: RolesState,
  action: RolesAction
): RolesState => {
  switch (action.type) {
    case "setRoles":
      return {
        ...state,
        roles: [...action.payload],
      };

    default:
      return state;
  }
};
