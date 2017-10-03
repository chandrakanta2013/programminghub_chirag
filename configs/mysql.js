/**********************
 MODULE INITIALISTAION
 **********************/
config = require('./configs');
mysql = require('mysql');

/**************************
 METHOD TO CONNECT DATABASE
 **************************/
let dbConfig = {
    connectionLimit: config.connectionLimit,
    host: config.host,
    user: config.user,
    password: config.password,
    database: config.database,
    multipleStatements: true
};

let connection = mysql.createConnection(dbConfig);

module.exports = {connection: connection};

