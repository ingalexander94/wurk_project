const { check } = require("express-validator");
const stopValidate = require("../middlewares/validate-request.js");

const validateDevice = () => {
  return [
    check("id", "DM1000").isNumeric(),
    check("number", "DM1001").trim().not().isEmpty(),
    check("code", "DM1002").trim().not().isEmpty(),
    stopValidate,
  ];
};

module.exports = {
  validateDevice,
};
