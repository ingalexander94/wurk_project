const envs = {
  PORT: parseInt(process.env.PORT || "3000"),
  API_KEY: process.env.API_KEY || "",
  JWT_SEED: process.env.JWT_SEED || "",
  URL_FRONTEND: process.env.URL_FRONTEND || "",
  DB_HOST: process.env.DB_HOST || "localhost",
  DB_PORT: parseInt(process.env.DB_PORT || "3311"),
  DB_USER: process.env.DB_USER || "",
  DB_PASSWORD: process.env.DB_PASSWORD || "",
  DB_NAME: process.env.DB_NAME || "",
  EMAIL_PASSWORD: process.env.EMAIL_PASSWORD || "",
  EMAIL_USER: process.env.EMAIL_USER || "",
  EMAIL_HOST: process.env.EMAIL_HOST || "",
  EMAIL_PORT: parseInt(process.env.EMAIL_PORT || "465"),
  EMAIL_WIEDII: process.env.EMAIL_WIEDII,
};

module.exports = envs;
