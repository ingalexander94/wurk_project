import axios from "axios";
import { IDevice } from "src/interfaces";
import { CustomStorage } from "src/lib/Storage";
import { DeviceEndpoints } from "src/models";
import { loadAbort } from "src/utilities";

export class DeviceService {
  private static API_URL = `${import.meta.env.VITE_API_URL}/backpanel/devices`;

  static getDevices(page: string) {
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

  static saveDevice(device: IDevice) {
    const controller = loadAbort();
    return {
      call: axios.post(`${this.API_URL}/${DeviceEndpoints.save}`, device, {
        headers: {
          Authorization: `Bearer ${CustomStorage.token}`,
        },
      }),
      controller,
    };
  }
}
