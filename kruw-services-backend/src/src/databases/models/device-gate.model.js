const { connectDB } = require("../connection");

class DeviceGateModel {
  static findByDeviceAndGate = async (id_device, id_gate) => {
    try {
      const db = await connectDB();
      const deviceGate = await db
        .select("*")
        .from("device_gate")
        .where({ id_device, id_gate })
        .first();
      return deviceGate;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = DeviceGateModel;
