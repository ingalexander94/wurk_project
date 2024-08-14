const { check } = require("express-validator");
const stopValidate = require("../middlewares/validate-request.js");

const validateRole = () => {
  return [
    check("id", "RM1000").isNumeric(),
    check("name", "RM1001").trim().not().isEmpty(),
    check("description", "RM1002").trim().not().isEmpty(),
    check("permissions").isArray().withMessage("RM1003"),
    stopValidate,
  ];
};

module.exports = {
  validateRole,
};
