const { Router } = require("express");
const RoleController = require("../../../controllers/role.controller");
const { validateRole } = require("../../../validators/role.validator");

// /api/v1/backpanel/roles
class RoleRoutes {
  static get routes() {
    const router = Router();
    router.get("/", RoleController.all);
    router.post("/save", validateRole(), RoleController.save);
    router.delete("/:id", RoleController.delete);
    return router;
  }
}

module.exports = RoleRoutes;
