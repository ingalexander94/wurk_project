const { Router } = require("express");
const AuthMiddleware = require("../../middlewares/validate-token");
const UserRoutes = require("./users/users.router");
const RoleRoutes = require("./roles/roles.router");

// /api/v1/backpanel
class BackpanelRoutes {
  static get routes() {
    const router = Router();
    router.use(AuthMiddleware.validateJWT);
    router.use("/users", UserRoutes.routes);
    router.use("/roles", RoleRoutes.routes);
    return router;
  }
}

module.exports = BackpanelRoutes;
