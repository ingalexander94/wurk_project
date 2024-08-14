import { createContext } from "react";
import { Toast, UIState } from "src/interfaces";

export type UIContextProps = {
  uiState: UIState;
  toggleCheking: () => void;
  setStep: (step: number) => void;
  setEmail: (email: string) => void;
  setCode: (code: string) => void;
  setRefreshTechnicians: () => void;
  setToast: (toast: Toast | null) => void;
};

export const UIContext = createContext<UIContextProps>({} as UIContextProps);
