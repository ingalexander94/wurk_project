import { createContext } from "react";
import { ICompany, IUser, UserState } from "src/interfaces";

export type UserContextProps = {
  userState: UserState;
  setUsers: (users: IUser[]) => void;
  setCompanies: (companies: ICompany[]) => void;
};

export const UserContext = createContext<UserContextProps>(
  {} as UserContextProps
);
