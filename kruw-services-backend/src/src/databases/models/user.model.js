const { connectDB } = require("../connection");

class UserModel {
  static create = async ({
    firstname,
    lastname,
    email,
    password,
    identifier,
    phone,
  }) => {
    try {
      const db = await connectDB();
      const [id_user] = await db
        .insert(
          {
            firstname,
            lastname,
            email,
            password,
            identifier,
            phone,
            id_profile: 1,
            active: 1,
          },
          ["id_user"]
        )
        .into("user");
      return id_user;
    } catch (error) {
      throw error;
    }
  };

  static findAll = async () => {
    try {
      const db = await connectDB();
      const users = await db
        .select(
          "id_user",
          "firstname",
          "lastname",
          "email",
          "identifier",
          "phone"
        )
        .from("user");
      return users;
    } catch (error) {
      throw error;
    }
  };

  static findOneByColumn = async (column, value) => {
    try {
      const db = await connectDB();
      const users = await db
        .select("*")
        .from("user")
        .where(column, value)
        .first();
      return users;
    } catch (error) {
      throw error;
    }
  };

  static updateColumnByUserId = async (id, data) => {
    try {
      const db = await connectDB();
      const updatedRows = await db
        .from("user")
        .where("id_user", id)
        .update(data);
      return updatedRows;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = UserModel;
