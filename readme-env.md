1. Instalar dotenv

En la raíz de tu proyecto ejecuta:

npm install dotenv

2. Crear archivo .env

En la raíz del proyecto crea un archivo llamado .env (¡no lo subas a GitHub!).

Ejemplo:

DB_USER=mi_usuario
DB_PASSWORD=mi_contraseña_segura
DB_SERVER=localhost
DB_PORT=1433
DB_NAME=MiBaseDeDatos

3. Usar dotenv en tu código

En tu archivo principal (por ejemplo index.js o app.js):

require('dotenv').config(); // cargar las variables del .env

const sql = require('mssql');

const config = {
user: process.env.DB_USER,
password: process.env.DB_PASSWORD,
server: process.env.DB_SERVER,
port: parseInt(process.env.DB_PORT), // los puertos deben ser número
database: process.env.DB_NAME,
options: {
encrypt: false,
trustServerCertificate: true
}
};

sql.connect(config)
.then(() => console.log("✅ Conectado a SQL Server"))
.catch(err => console.error("❌ Error de conexión:", err));

4. Ignorar el archivo .env

En tu archivo .gitignore agrega:

.env
