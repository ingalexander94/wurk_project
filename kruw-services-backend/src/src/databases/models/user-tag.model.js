const { connectDB } = require("../connection");

class UserTagModel {
  static findByTag = async (id_tag) => {
    try {
      const db = await connectDB();
      const userTag = await db
        .select("*")
        .from("user_tag")
        .where({ id_tag })
        .first();
      return userTag;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = UserTagModel;
