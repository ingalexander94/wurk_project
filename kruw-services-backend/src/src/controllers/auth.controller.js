const { response, request } = require("express");
const CustomError = require("../config/errors");
const UserModel = require("../databases/models/user.model");
const Encrypter = require("../config/encryptor");
const JWT = require("../config/jwt");
const { sendRecoveryCode } = require("../email/emails");

class AuthController {
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

  static login = async (req = request, res = response) => {
    try {
      let data = req.body;
      const user = await UserModel.findOneByColumn("email", data.email);
      if (!user) throw CustomError.loginError("AU2000");
      const { password, active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      const isValidPassword = Encrypter.compare(data.password, password);
      if (!isValidPassword) throw CustomError.loginError("AU2002");
      await UserModel.updateColumnByUserId(user.id_user, { code: null });
      const token = await JWT.generateToken({
        email: user.email,
        role: user.id_profile,
      });
      return res.status(200).json({
        status: true,
        data: {
          token,
          user: {
            names: user.firstname,
            surnames: user.lastname,
            email: user.email,
            photo: null,
            role: user.id_profile,
          },
        },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static validateEmail = async (req = request, res = response) => {
    try {
      let { email } = req.body;
      const user = await UserModel.findOneByColumn("email", email);
      if (!user) throw CustomError.loginError("AU2000");
      const { active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      return res.status(200).json({ status: true, data: null, error: null });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static renew = async (req = request, res = response) => {
    try {
      const { email } = req;
      const user = await UserModel.findOneByColumn("email", email);
      if (!user) throw CustomError.loginError("AU2000");
      const { active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      const token = await JWT.generateToken({
        email: user.email,
        role: user.id_profile,
      });
      return res.status(200).json({
        status: true,
        data: {
          token,
          user: {
            names: user.firstname,
            surnames: user.lastname,
            email: user.email,
            photo: null,
            role: user.id_profile,
          },
        },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static recoveryPassword = async (req = request, res = response) => {
    try {
      let { email } = req.body;
      const user = await UserModel.findOneByColumn("email", email);
      if (!user) throw CustomError.loginError("AU2000");
      const { active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      const code = Math.floor(Math.random() * 900000) + 100000;
      await UserModel.updateColumnByUserId(user.id_user, { code: code });
      const sendEmail = await sendRecoveryCode(email, code);
      if (!sendEmail) throw CustomError.notFound("AU2003");
      return res.status(200).json({
        status: true,
        data: null,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static validateCode = async (req = request, res = response) => {
    try {
      let { email, code } = req.body;
      const user = await UserModel.findOneByColumn("email", email);
      if (!user) throw CustomError.loginError("AU2000");
      const { active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      if (user.code !== code) throw CustomError.notFound("AU2004");
      return res.status(200).json({
        status: true,
        data: null,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static updatePassword = async (req = request, res = response) => {
    try {
      let { email, password, code } = req.body;
      const user = await UserModel.findOneByColumn("email", email);
      if (!user) throw CustomError.loginError("AU2000");
      const { active, id_profile } = user;
      if (!active || id_profile !== 2) throw CustomError.loginError("AU2001");
      if (user.code !== code) throw CustomError.notFound("AU2004");
      const newPassword = Encrypter.hash(password);
      await UserModel.updateColumnByUserId(user.id_user, { code: null });
      await UserModel.updateColumnByUserId(user.id_user, {
        password: newPassword,
      });
      const token = await JWT.generateToken({
        email: user.email,
        role: user.id_profile,
      });
      return res.status(200).json({
        status: true,
        data: {
          token,
          user: {
            names: user.firstname,
            surnames: user.lastname,
            email: user.email,
            photo: null,
            role: user.id_profile,
          },
        },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };
}

module.exports = AuthController;
