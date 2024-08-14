const { Router } = require("express");
const AuthRoutes = require("./auth/auth.router");
const BackpanelRoutes = require("./backpanel/backpanel.router");
const PrivateRoutes = require("./private/private.router");

class AppRouter {
  static get routes() {
    const router = Router();

    router.get("/api", (_, res) => {
      return res.status(200).send("Welcome to Kruw API");
    });

    router.use("/api/v1/auth", AuthRoutes.routes);
    router.use("/api/v1/backpanel", BackpanelRoutes.routes);
    router.use("/api/v1/private", PrivateRoutes.routes);

    return router;
  }
}

module.exports = AppRouter;
