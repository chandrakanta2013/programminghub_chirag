/**********************
 MODULE INITIALISTAION
 **********************/
config  = require('./configs');
mysql   = require('mysql');

/**************************
 METHOD TO CONNECT DATABASE
 **************************/
var dbConfig = {
    connectionLimit : config.connectionLimit,
    host     : config.host,
    user     : config.user,
    password : config.password,
    database : config.database
}
var pool = mysql.createPool(dbConfig);

module.exports = pool;
