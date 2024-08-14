const { request, response } = require("express");
const CustomError = require("../config/errors");
const envs = require("../config/environments");
const TransactionalLogModel = require("../databases/models/transactional-log.model");
const JsonErrorReader = require("../config/reader");

class ApiMiddleware {
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

  static validateApiKey = async (req = request, res = response, next) => {
    try {
      const authorization = req.header("Authorization");
      if (!authorization) throw CustomError.forbidden("AC1104");
      if (authorization.toLowerCase() !== envs.API_KEY)
        throw CustomError.unauthorized("AC1105");
      next();
    } catch (error) {
      const { device, tag } = req.body;
      const description = JsonErrorReader.readError(error.message);
      await TransactionalLogModel.save({
        device_number: device ?? "N/A",
        tag_number: tag ?? "N/A",
        description,
      });
      this.#handleError(error, res);
    }
  };
}

module.exports = ApiMiddleware;
