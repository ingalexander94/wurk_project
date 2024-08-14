const { connectDB } = require("../connection");

class PermissionModel {
  static create = async (permissions) => {
    try {
      const db = await connectDB();
      await db.insert(permissions).into("permissions");
      return true;
    } catch (error) {
      throw error;
    }
  };

  static deleteByRole = async (id_role) => {
    try {
      const db = await connectDB();
      await db.from("permissions").where({ profile: id_role }).del();
      return true;
    } catch (error) {
      throw error;
    }
  };

  static findByRole = async (id) => {
    try {
      const db = await connectDB();
      const permissions = await db
        .select("module")
        .from("permissions")
        .where({ profile: id });
      return permissions;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = PermissionModel;
