const mysql = require('mysql2');

exports.pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "onlinecampus",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  });