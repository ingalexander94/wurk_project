const { Router } = require("express");
const DeviceController = require("../../../controllers/device.controller");
const { validateDevice } = require("../../../validators/device.validator");

// /api/v1/backpanel/devices
class DevicesRoutes {
  static get routes() {
    const router = Router();
    router.get("/", DeviceController.all);
    router.post("/save", validateDevice(), DeviceController.save);
    //router.delete("/:id", DeviceController.delete);
    return router;
  }
}

module.exports = DevicesRoutes;
