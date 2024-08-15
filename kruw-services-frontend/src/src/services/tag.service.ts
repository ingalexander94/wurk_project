import axios from "axios";
import { ITag } from "src/interfaces";
import { CustomStorage } from "src/lib/Storage";
import { TagEndpoints } from "src/models";
import { loadAbort } from "src/utilities";

export class TagService {
  private static API_URL = `${import.meta.env.VITE_API_URL}/backpanel/tags`;

  static getTags(page: string) {
    const controller = loadAbort();
    return {
      call: axios.get(`${this.API_URL}?page=${page}`, {
        headers: {
          Authorization: `Bearer ${CustomStorage.token}`,
        },
      }),
      controller,
    };
  }

  static saveTag(tag: ITag) {
    const controller = loadAbort();
    return {
      call: axios.post(`${this.API_URL}/${TagEndpoints.save}`, tag, {
        headers: {
          Authorization: `Bearer ${CustomStorage.token}`,
        },
      }),
      controller,
    };
  }
}
