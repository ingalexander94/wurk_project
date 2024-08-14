import { ICompany, IUser, UserState } from "src/interfaces";

type UserAction =
  | { type: "setUsers"; payload: IUser[] }
  | { type: "setCompanies"; payload: ICompany[] };

export const userReducer = (
  state: UserState,
  action: UserAction
): UserState => {
  switch (action.type) {
    case "setUsers":
      return {
        ...state,
        users: [...action.payload],
      };
    case "setCompanies":
      return {
        ...state,
        companies: [...action.payload],
      };
    default:
      return state;
  }
};
