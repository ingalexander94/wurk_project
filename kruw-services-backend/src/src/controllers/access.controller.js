const { response, request } = require("express");
const CustomError = require("../config/errors");
const TagModel = require("../databases/models/tag.model");
const UserTagModel = require("../databases/models/user-tag.model");
const DeviceModel = require("../databases/models/device.model");
const DeviceGateModel = require("../databases/models/device-gate.model");
const LogAccessModel = require("../databases/models/log-access.model");
const TransactionalLogModel = require("../databases/models/transactional-log.model");
const JsonErrorReader = require("../config/reader");

class AccessController {
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
      .json({ status: false, statusCode: 500, data: null, error: "AC5000" });
  };

  static controlAccess = async (req = request, res = response) => {
    const { device, tag } = req.body;
    try {
      const deviceDB = await DeviceModel.findByNumber(device);
      if (!deviceDB) throw CustomError.notFound("AC1100");
      const tagDB = await TagModel.findByNumber(tag);
      if (!tagDB) throw CustomError.notFound("AC1101");
      const { id_tag } = tagDB;
      const { id_device } = deviceDB;
      const userTagDB = await UserTagModel.findByTag(id_tag);
      if (!userTagDB) throw CustomError.forbidden("AC1102");
      const { id_user_tag, id_gate } = userTagDB;
      const deviceGateDB = await DeviceGateModel.findByDeviceAndGate(
        id_device,
        id_gate
      );
      if (!deviceGateDB) {
        throw CustomError.forbidden("AC1103");
      }
      const { id_device_gate } = deviceGateDB;
      await LogAccessModel.save({
        id_device: id_device_gate,
        id_user_tag,
        grant: 1,
        description: "SUCCESSFUL",
      });
      return res.status(200).json({
        status: true,
        statusCode: 200,
        data: null,
        error: null,
      });
    } catch (error) {
      const description = JsonErrorReader.readError(error.message);
      await TransactionalLogModel.save({
        device_number: device,
        tag_number: tag,
        description,
      });
      this.#handleError(error, res);
    }
  };
}

module.exports = AccessController;
