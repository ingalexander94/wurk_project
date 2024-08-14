const { check } = require("express-validator");
const stopValidate = require("../middlewares/validate-request.js");

const validateRegister = () => {
  return [
    check("firstname", "AU1000").trim().isLength({
      min: 2,
      max: 100,
    }),
    check("lastname", "AU1001").trim().isLength({
      min: 2,
      max: 100,
    }),
    check("email", "AU1002").matches(
      /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
    ),
    check("password", "AU1003").trim().not().isEmpty(),
    check("identifier", "AU1004").trim().not().isEmpty(),
    check("phone", "AU1005").trim().not().isEmpty(),
    stopValidate,
  ];
};

const validateLogin = () => {
  return [
    check("email", "AU1002").matches(
      /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
    ),
    check("password", "AU1003").matches(
      /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{10,}$/
    ),
    stopValidate,
  ];
};

const validateEmailFormat = () => {
  return [
    check("email", "AU1002").matches(
      /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
    ),
    stopValidate,
  ];
};

const validateCodeFormat = () => {
  return [
    check("email", "AU1002").matches(
      /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
    ),
    check("code", "AU2004").matches(/^\d{6}$/),
    stopValidate,
  ];
};

const validateUpdatePassword = () => {
  return [
    check("email", "AU1002").matches(
      /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/
    ),
    check("password", "AU1003").matches(
      /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\\-]{10,}$/
    ),
    check("code", "AU2004").matches(/^\d{6}$/),
    stopValidate,
  ];
};

module.exports = {
  validateRegister,
  validateLogin,
  validateEmailFormat,
  validateCodeFormat,
  validateUpdatePassword,
};
