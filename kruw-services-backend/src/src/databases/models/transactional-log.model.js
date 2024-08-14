const { connectDB } = require("../connection");

class TransactionalLogModel {
  static save = async ({ device_number, tag_number, description }) => {
    try {
      const db = await connectDB();
      const [id_log] = await db
        .insert(
          {
            device_number,
            tag_number,
            description,
          },
          ["id_log"]
        )
        .into("transactional_log");
      return id_log;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = TransactionalLogModel;
