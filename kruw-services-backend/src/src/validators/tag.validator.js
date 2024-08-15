const { check } = require("express-validator");
const stopValidate = require("../middlewares/validate-request.js");

const validateTag = () => {
  return [
    check("id", "TM1000").isNumeric(),
    check("number", "TM1001").trim().not().isEmpty(),
    check("code", "TM1002").trim().not().isEmpty(),
    check("status", "TM1003").trim().not().isEmpty(),
    stopValidate,
  ];
};

module.exports = {
  validateTag,
};
