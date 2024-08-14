const { connectDB } = require("../connection");

class DeviceModel {
  static findByNumber = async (number_device) => {
    try {
      const db = await connectDB();
      const device = await db
        .select("id_device")
        .from("device")
        .where({ number_device })
        .first();
      return device;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = DeviceModel;
