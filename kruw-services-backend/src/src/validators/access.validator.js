const { check } = require("express-validator");
const stopValidate = require("../middlewares/validate-request.js");

const validateAccess = () => {
  return [
    check("device", "AC1000").trim().not().isEmpty(),
    check("tag", "AC1001").trim().not().isEmpty(),
    stopValidate,
  ];
};

module.exports = {
  validateAccess,
};
