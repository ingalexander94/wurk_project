const { Router } = require("express");
const TagController = require("../../../controllers/tag.controller");
const { validateTag } = require("../../../validators/tag.validator");

// /api/v1/backpanel/tags
class TagRoutes {
  static get routes() {
    const router = Router();
    router.get("/", TagController.all);
    router.post("/save", validateTag(), TagController.save);
    // router.delete("/:id", TagController.delete);
    return router;
  }
}

module.exports = TagRoutes;
