const { response } = require("express");
const CustomError = require("../config/errors");
const UserModel = require("../databases/models/user.model");

class UserController {
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

  static list = async (_, res = response) => {
    try {
      const users = await UserModel.findAll();
      return res.status(200).json({
        status: true,
        statusCode: 200,
        data: users,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static getCompanies = async (_, res = response) => {
    try {
      const companies = [
        {
          id: 1,
          name: "Wiedii",
        },
        {
          id: 2,
          name: "Independientes",
        },
        {
          id: 3,
          name: "Empresas",
        },
      ];
      return res.status(200).json({
        status: true,
        data: companies,
        error: null,
      });
    } catch (error) {
      this.#handleError(error);
    }
  };
}

module.exports = UserController;
