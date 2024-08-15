const { connectDB } = require("../connection");

class DeviceModel {

  static findById = async (id) => {
    try {
      const db = await connectDB();
      const device = await db
        .select("id_device")
        .from("device")
        .where({ id_device: id, state_device: 1 })
        .first();
      return device;
    } catch (error) {
      throw error;
    }
  };

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

  static findByCode = async (code_device) => {
    try {
      const db = await connectDB();
      const device = await db
        .select("id_device")
        .from("device")
        .where({ code_device })
        .first();
      return device;
    } catch (error) {
      throw error;
    }
  };

  static findAll = async (limit, offset) => {
    try {
      const db = await connectDB();
      const devices = await db
        .select(
          "device.id_device AS id",
          "device.number_device AS number",
          "device.code_device AS code",
        ) 
        .from("device")
        .where("device.state_device", 1)
        .limit(limit)
        .offset(offset);
      return devices;
    } catch (error) {
      throw error;
    }
  };

  static countAll = async () => {
    try {
      const db = await connectDB();
      const total = await db
        .count({ total: "id_device" })
        .from("device")
        .where({ state_device: 1 })
        .first();
      return total;
    } catch (error) {
      throw error;
    }
  };

  static create = async (number, code) => {
    try {
      const db = await connectDB();
      const [id_device] = await db
        .insert(
          {
            number_device: number,
            code_device: code,
          },
          ["id_device"]
        )
        .into("device");
      return id_device;
    } catch (error) {
      throw error;
    }
  };

  static update = async (id, number, code) => {
    try {
      const db = await connectDB();
      const updatedRows = await db
        .from("device")
        .where("id_device", id)
        .update({
          number_device: number,
          code_device: code,
        });
      return updatedRows;
    } catch (error) {
      throw error;
    }
  };
}

module.exports = DeviceModel;
