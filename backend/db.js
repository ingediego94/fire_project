require("dotenv").config();

const sql = require("mssql"); //To connect a SQL Server Database

const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  port: parseInt(process.env.DB_PORT),
  database: process.env.DB_DATABASE,
  options: {
    encrypt: false, // on local is not necesary
    trustServerCertificate: true,
  },
};

sql
  .connect(config)
  .then(() => console.log("✅ Connection stablished successfully."))
  .catch((err) => console.error("❌ Error with the connection:", err));
