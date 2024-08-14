const { connectDB } = require("../connection");

class ProfileModel {
  static findById = async (id) => {
    try {
      const db = await connectDB();
      const role = await db
        .select(["id_profile", "profile_name", "profile_description"])
        .from("profile")
        .where({ id_profile: id, profile_state: 1 })
        .first();
      return role;
    } catch (error) {
      throw error;
    }
  };

  static findByName = async (name) => {
    try {
      const db = await connectDB();
      const role = await db
        .select(["id_profile"])
        .from("profile")
        .where({ profile_name: name, profile_state: 1 })
        .first();
      return role;
    } catch (error) {
      throw error;
    }
  };

  static findAll = async (limit, offset) => {
    try {
      const db = await connectDB();
      const roles = await db
        .select(
          "profile.id_profile AS id",
          "profile.profile_name AS name",
          "profile.profile_description AS description"
        )
        .from("profile")
        .where("profile.profile_state", 1)
        .limit(limit)
        .offset(offset);
      return roles;
    } catch (error) {
      throw error;
    }
  };

  static countAll = async () => {
    try {
      const db = await connectDB();
      const total = await db
        .count({ total: "id_profile" })
        .from("profile")
        .where({ profile_state: 1 })
        .first();
      return total;
    } catch (error) {
      throw error;
    }
  };

  static create = async (name, description) => {
    try {
      const db = await connectDB();
      const [id_profile] = await db
        .insert(
          {
            profile_name: name,
            profile_description: description,
          },
          ["id_profile"]
        )
        .into("profile");
      return id_profile;
    } catch (error) {
      throw error;
    }
  };

  static update = async (id, name, description) => {
    try {
      const db = await connectDB();
      const updatedRows = await db
        .from("profile")
        .where("id_profile", id)
        .update({
          profile_name: name,
          profile_description: description,
        });
      return updatedRows;
    } catch (error) {
      throw error;
    }
  };

  static inactivate = async (id) => {
    try {
      const db = await connectDB();
      const updatedRows = await db
        .from("profile")
        .where("id_profile", id)
        .update({
          profile_state: 0,
        });
      return updatedRows;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = ProfileModel;
