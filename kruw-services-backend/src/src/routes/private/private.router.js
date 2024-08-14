const { Router } = require("express");
const ApiMiddleware = require("../../middlewares/validate-api-key");
const UserRoutes = require("./users/users.router");
const AccessRoutes = require("./access/access.router");

// /api/v1/private
class PrivateRoutes {
  static get routes() {
    const router = Router();
    router.use(ApiMiddleware.validateApiKey);
    router.use("/users", UserRoutes.routes);
    router.use("/access", AccessRoutes.routes);
    return router;
  }
}

module.exports = PrivateRoutes;
