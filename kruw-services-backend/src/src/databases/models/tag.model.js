const { connectDB } = require("../connection");

class TagModel {
  static findById = async (id) => {
    try {
      const db = await connectDB();
      const tag = await db
        .select("id_tag")
        .from("tag")
        .where({ id_tag: id, tag_state: 1 })
        .first();
      return tag;
    } catch (error) {
      throw error;
    }
  };

  static findByNumber = async (tag_number) => {
    try {
      const db = await connectDB();
      const tag = await db
        .select("id_tag")
        .from("tag")
        .where({ tag_number, tag_state: 1 })
        .first();
      return tag;
    } catch (error) {
      throw error;
    }
  };

  static findByCodeAndNumber = async (code, tag_number) => {
    try {
      const db = await connectDB();
      const tag = await db
        .select("id_tag")
        .from("tag")
        .where({ code, tag_number, tag_state: 1 })
        .first();
      return tag;
    } catch (error) {
      throw error;
    }
  };

  static findAll = async (limit, offset) => {
    try {
      const db = await connectDB();
      const tags = await db
        .select(
          "tag.id_tag AS id",
          "tag.tag_number AS number",
          "tag.code AS code",
          db.raw(" DATE_FORMAT(tag.tag_date_creation, '%d-%m-%Y') AS date"),
          "tag.tag_status AS status"
        )
        .from("tag")
        .where("tag.tag_state", 1)
        .limit(limit)
        .offset(offset);
      return tags;
    } catch (error) {
      throw error;
    }
  };

  static countAll = async () => {
    try {
      const db = await connectDB();
      const total = await db
        .count({ total: "id_tag" })
        .from("tag")
        .where({ tag_state: 1 })
        .first();
      return total;
    } catch (error) {
      throw error;
    }
  };

  static create = async (number, code, status) => {
    try {
      const db = await connectDB();
      const [id_tag] = await db
        .insert(
          {
            tag_number: number,
            code,
            tag_status: status,
          },
          ["id_tag"]
        )
        .into("tag");
      return id_tag;
    } catch (error) {
      throw error;
    }
  };

  static update = async (id, number, code, status) => {
    try {
      const db = await connectDB();
      const updatedRows = await db.from("tag").where("id_tag", id).update({
        tag_number: number,
        code,
        tag_status: status,
      });
      return updatedRows;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = TagModel;
