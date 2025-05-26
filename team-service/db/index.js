const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',
  user: 'superadmin',
  password: 'Tromaticwolf28',
  database: 'devcamp'
});

module.exports = db;
