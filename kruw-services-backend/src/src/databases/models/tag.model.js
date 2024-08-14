const { connectDB } = require("../connection");

class TagModel {
  static findByNumber = async (tag_number) => {
    try {
      const db = await connectDB();
      const tag = await db
        .select("id_tag")
        .from("tag")
        .where({ tag_number })
        .first();
      return tag;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = TagModel;
