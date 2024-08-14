const { Router } = require("express");
const AccessController = require("../../../controllers/access.controller");
const { validateAccess } = require("../../../validators/access.validator");

// /api/v1/private/access

class AccessRoutes {
  static get routes() {
    const router = Router();
    router.post("/", validateAccess(), AccessController.controlAccess);
    return router;
  }
}

module.exports = AccessRoutes;
