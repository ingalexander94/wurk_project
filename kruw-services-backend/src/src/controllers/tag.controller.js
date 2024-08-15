const { request, response } = require("express");
const CustomError = require("../config/errors");
const TagModel = require("../databases/models/tag.model");

class TagController {
  static #handleError = (error, res = response) => {
    if (error instanceof CustomError) {
      return res.status(error.statusCode).json({
        status: false,
        statusCode: error.statusCode,
        data: null,
        error: error.message,
      });
    }
    console.error(error);
    return res
      .status(500)
      .json({ status: false, statusCode: 500, data: null, error: "AU5000" });
  };

  static all = async (req = request, res = response) => {
    try {
      const page = parseInt(req.query?.page) || 1;
      const limit = parseInt(req.query?.perPage) || 8;
      const offset = (page - 1) * limit;
      let total_pages = 1;
      let total = 0;
      const tags = await TagModel.findAll(limit, offset);
      if (tags.length) {
        const countTags = await TagModel.countAll();
        if (countTags) {
          total_pages = Math.ceil(countTags.total / limit);
          total = countTags.total;
        }
      }
      return res.status(200).json({
        status: true,
        data: { total, total_pages, tags },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static save = async (req = request, res = response) => {
    try {
      const data = req.body;
      let last_page = 1;
      if (data.id == 0) {
        const tag = await TagModel.findByCodeAndNumber(data.code, data.number);
        if (tag) throw CustomError.badRequest("TM1100");
        const id_tag = await TagModel.create(
          data.number,
          data.code,
          data.status
        );
        data.id = id_tag;
      } else {
        let tag = await TagModel.findById(data.id);
        if (!tag) throw CustomError.badRequest("TM1101");
        tag = await TagModel.findByCodeAndNumber(data.code, data.number);
        if (tag && parseInt(tag.id_tag) !== parseInt(data.id))
          throw CustomError.badRequest("TM1100");
        await TagModel.update(data.id, data.number, data.code, data.status);
      }
      const countTags = await TagModel.countAll();
      if (countTags) {
        last_page = Math.ceil(countTags.total / 8);
      }
      return res.status(200).json({
        status: true,
        data: { last_page, tag: data },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  /* static delete = async (req = request, res = response) => {
    try {
      const { id } = req.params;
      let role = await ProfileModel.findById(id);
      if (!role) throw CustomError.badRequest("RM1101");
      await ProfileModel.inactivate(id);
      return res.status(200).json({
        status: true,
        data: null,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  }; */
}

module.exports = TagController;
