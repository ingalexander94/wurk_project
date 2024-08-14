const { connectDB } = require("../connection");

class LogAccessModel {
  static save = async ({ id_device, id_user_tag, grant, description }) => {
    try {
      const db = await connectDB();
      const [id_log] = await db
        .insert(
          {
            id_device,
            id_user_tag,
            grant,
            description,
          },
          ["id_log"]
        )
        .into("log_access");
      return id_log;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = LogAccessModel;
