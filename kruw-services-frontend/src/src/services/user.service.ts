import axios from "axios";
import { CustomStorage } from "src/lib/Storage";
import { UserEndpoints } from "src/models";
import { loadAbort } from "src/utilities";

export class UserService {
  private static API_URL = `${import.meta.env.VITE_API_URL}/backpanel/users`;

  static getCompanies() {
    const controller = loadAbort();
    return {
      call: axios.get(`${this.API_URL}/${UserEndpoints.companies}`, {
        headers: {
          Authorization: `Bearer ${CustomStorage.token}`,
        },
      }),
      controller,
    };
  }
}
