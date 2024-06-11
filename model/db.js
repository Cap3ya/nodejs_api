let mysql = require('mysql');
require('dotenv').config();

const mc = mysql.createConnection({
    host: 'localhost',
    user: process.env.DB_USER,
    password: process.env.DB_SECRET_KEY,
    database: process.env.DB_BDD
});

mc.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
        return;
    }
    console.log('Connected to the database as id ' + mc.threadId);
});

module.exports = mc;
