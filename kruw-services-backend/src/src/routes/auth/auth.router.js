const { Router } = require("express");
const AuthController = require("../../controllers/auth.controller");
const AuthMiddleware = require("../../middlewares/validate-token");
const {
  validateRegister,
  validateLogin,
  validateEmailFormat,
  validateCodeFormat,
  validateUpdatePassword,
} = require("../../validators/auth.validator");

// /api/v1/auth
class AuthRoutes {
  static get routes() {
    const router = Router();
    router.post("/login", validateLogin(), AuthController.login);
    router.post(
      "/recovery",
      validateEmailFormat(),
      AuthController.recoveryPassword
    );
    router.post(
      "/validate_code",
      validateCodeFormat(),
      AuthController.validateCode
    );
    router.post(
      "/validate_email",
      validateEmailFormat(),
      AuthController.validateEmail
    );
    router.patch(
      "/update_password",
      validateUpdatePassword(),
      AuthController.updatePassword
    );
    router.get("/renew", AuthMiddleware.validateJWT, AuthController.renew);
    return router;
  }
}

module.exports = AuthRoutes;
