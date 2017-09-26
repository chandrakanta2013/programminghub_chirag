/**********************
 MODULE INITIALISTAION
 **********************/
var mysql           = require('mysql');
var pool            = require('../../configs/mysql');

/*********************
 PROGRAM SAVE DB QUERY
 *********************/
exports.saveprogramModel = function(data) {

    // Connecting to database
    pool.getConnection(function(err,connection){

        // Preparing queries and calling store procedures
        var query = "CALL saveprogram(?,?,?,?,?,?,?,?,?);";
        var table = [data.programname,data.programdescription,data.programcategory,data.code,data.exampleoutput,data.difficultylevel,data.Isrunnable,data.input,data.output];
        queryResult = mysql.format(query, table);

        // Executing Db query
        connection.query(queryResult,function(err,rows){
            if (err) {
                return err
            }
        });

        // Handling error
        connection.on('error', function(err) {
            throw err;
            return;
        });

    });

}

/*****************
 GET PROGRAM MODEL
 *****************/
exports.getprogramModel = function(data, callback) {

    // Connecting to database
    pool.getConnection(function(err,connection){

        //Handling connection error
        if (err) {
            throw err;
        }

        // Preparing queries and calling store procedures
        var query = "CALL getprogram(?,?,?,?);";
        var table = [data.language,data.version,data.client,data.app];
        queryResult = mysql.format(query, table);

        // Executing Db query
        connection.query(queryResult,function(err,rows){
            if(err) {
                callback(null, err)
            } else {
                callback(null, rows[0])
            }
        });

        //Handling error
        connection.on('error', function(err) {
            throw err;
            return;
        });
    });

}
