import { useReducer } from "react";
import { ICompany, IUser, UserState } from "src/interfaces";
import { UserContext } from "./user.context";
import { userReducer } from "./user.reducer";

const INITIAL_STATE: UserState = {
  users: [],
  companies: [],
};

interface Props {
  children: JSX.Element | JSX.Element[];
}

export const UserProvider = ({ children }: Props) => {
  const [userState, dispatch] = useReducer(userReducer, INITIAL_STATE);

  const setUsers = (users: IUser[]) => {
    dispatch({ type: "setUsers", payload: users });
  };

  const setCompanies = (companies: ICompany[]) => {
    dispatch({ type: "setCompanies", payload: companies });
  };

  return (
    <UserContext.Provider
      value={{
        setUsers,
        setCompanies,
        userState,
      }}
    >
      {children}
    </UserContext.Provider>
  );
};
