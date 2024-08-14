const { request, response } = require("express");
const CustomError = require("../config/errors");
const ProfileModel = require("../databases/models/profile.model");
const PermissionModel = require("../databases/models/permission.model");

class RoleController {
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
      let roles = await ProfileModel.findAll(limit, offset);
      if (roles.length) {
        const countRoles = await ProfileModel.countAll();
        if (countRoles) {
          total_pages = Math.ceil(countRoles.total / limit);
          total = countRoles.total;
        }
        for (const role of roles) {
          role.permissions = [];
          const permissions = await PermissionModel.findByRole(role.id);
          if (permissions.length) {
            role.permissions = permissions.map(({ module }) =>
              module.toString()
            );
          }
        }
      }
      return res.status(200).json({
        status: true,
        data: { total, total_pages, roles },
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static save = async (req = request, res = response) => {
    try {
      const data = req.body;
      if (data.id == 0) {
        const role = await ProfileModel.findByName(data.name);
        if (role) throw CustomError.badRequest("RM1100");
        const id_profile = await ProfileModel.create(
          data.name,
          data.description
        );
        data.id = id_profile;
      } else {
        let role = await ProfileModel.findById(data.id);
        if (!role) throw CustomError.badRequest("RM1101");
        role = await ProfileModel.findByName(data.name);
        if (role && parseInt(role.id_profile) !== parseInt(data.id))
          throw CustomError.badRequest("RM1100");
        await ProfileModel.update(data.id, data.name, data.description);
        await PermissionModel.deleteByRole(data.id);
      }
      if (data.permissions.length) {
        const permissions = data.permissions.map((module) => ({
          profile: data.id,
          module,
        }));
        await PermissionModel.create(permissions);
      }
      return res.status(200).json({
        status: true,
        data: data,
        error: null,
      });
    } catch (error) {
      this.#handleError(error, res);
    }
  };

  static delete = async (req = request, res = response) => {
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
  };
}

module.exports = RoleController;
