export interface UserState {
  users: IUser[];
  companies: ICompany[];
}

export interface IUser {
  email: string;
}

export interface ICompany {
  id: number;
  name: string;
}
