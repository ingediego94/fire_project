require("dotenv").config();
const express = require("express");
const bodyParser = require("body-parser");
const db = require("./db");
// const {uploadCSVBack} = require('./helpers');
const cors = require("cors");
const multer = require("multer");
const upload = multer({ dest: "uploads/" });

const app = express();

const PORT = parseInt(process.env.PORT);

app.use(cors());

app.use(bodyParser.json());

// Endpoint to get maquinas
app.get("/getEngines", (req, res) => {
  const sql = `SELECT * FROM maquina`;

  db.query(sql, (err, results) => {
    if (err) {
      console.error("Error to obtain engines", err);
      return res.status(500).json({ error: "Error to get engines" });
    }

    res.json(results);
  });
});

// Listen port
app.listen(PORT, () => {
  console.log(`Server runing on http://localhost:${PORT}`);
});
