const { request, response } = require("express");
const CustomError = require("../config/errors");
const DeviceModel = require("../databases/models/device.model");

class DeviceController {
  static #handleError = (error, res = response) => {
    if (error instanceof CustomError) {
      return res.status(error.statusCode).json({
        status: false,
        statusCode: error.statusCode,
        data: null,
        error: error.message,
      });
    }
    console.error(error);
    return res
      .status(500)
      .json({ status: false, statusCode: 500, data: null, error: "AU5000" });
  };

  static all = async (req = request, res = response) => {
    try {
      const page = parseInt(req.query?.page) || 1;
      const limit = parseInt(req.query?.perPage) || 8;
      const offset = (page - 1) * limit;
      let total_pages = 1;
      let total = 0;
      const devices = await DeviceModel.findAll(limit, offset);
      if (devices.length) {
        const countDevices = await DeviceModel.countAll();
        if (countDevices) {
          total_pages = Math.ceil(countDevices.total / limit);
          total = countDevices.total;
        }
      }
      return res.status(200).json({
        status: true,
        data: { total, total_pages, devices },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static save = async (req = request, res = response) => {
    try {
      const data = req.body;
      let last_page = 1;
      if (data.id == 0) {
        const device = await DeviceModel.findByCode(data.code);
        if (device) throw CustomError.badRequest("DM1100");
        const id_device = await DeviceModel.create(data.number, data.code);
        data.id = id_device;
      } else {
        let device = await DeviceModel.findById(data.id);
        if (!device) throw CustomError.badRequest("DM1101");
        device = await DeviceModel.findByCode(data.code);
        if (device && parseInt(device.id_device) !== parseInt(data.id))
          throw CustomError.badRequest("DM1100");
        await DeviceModel.update(data.id, data.number, data.code);
      }
      const countDevices = await DeviceModel.countAll();
      if (countDevices) {
        last_page = Math.ceil(countDevices.total / 8);
      }
      return res.status(200).json({
        status: true,
        data: { last_page, device: data },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  /*  static delete = async (req = request, res = response) => {
    try {
      const { id } = req.params;
      let role = await ProfileModel.findById(id);
      if (!role) throw CustomError.badRequest("RM1101");
      await ProfileModel.inactivate(id);
      return res.status(200).json({
        status: true,
        data: null,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  */
}

module.exports = DeviceController;
