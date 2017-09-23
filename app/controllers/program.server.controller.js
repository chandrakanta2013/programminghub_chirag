/**********************
 MODULE INITIALISTAION
 **********************/
var config  = require('../../configs/configs');
var mysql   = require('mysql');
var pool      = require('../../configs/mysql');

/*************
PROGRAM SAVE API
****************/
exports.saveprogram = function(req, res) {
    var programRequestObject = req.body;

    if(programRequestObject) {
        if(!programRequestObject.programname && !programRequestObject.programcategory && !programRequestObject.code) {
            res.status(400);
            res.json({
                message: 'Please enter name, category and code'
            });
        }

        pool.getConnection(function(err,connection){

            /************************
             CALLING STORED PROCEDURE
             ************************/
            var myParams = "'"+programRequestObject.programname+"','"+programRequestObject.programdescription+"','"+programRequestObject.programcategory+"','"+programRequestObject.code+"','"+programRequestObject.exampleoutput+"',"+programRequestObject.difficultylevel+",'"+programRequestObject.Isrunnable+"','"+programRequestObject.input+"','"+programRequestObject.output+"'";
            var queryRequest = "CALL saveprogram(" + myParams + ")";

            connection.query(queryRequest,function(err,rows){
                if (err) {
                    res.json({
                        message: 'ERROR',
                        reason: 'Db issue'
                    });
                } else {
                    res.json({
                        message: 'SUCCESS',
                        reason: ''
                    });
                }
            });

            connection.on('error', function(err) {
                throw err;
                return;
            });
        });
    }

}

/****************
 GET PROGRAM API
 ****************/
exports.getprogram = function(req, res) {
    var programObject = req.body;

    if(programObject) {
        if(!programObject.client && !programObject.language) {
            res.status(400);
            res.json({
                message: 'Please enter client and language '
            });
        }

        pool.getConnection(function(err,connection){

            /************************
             MULTIPLE JOIN QUERY
             ************************/
            var query = "select "
            query += " program.id as id,"
            query +=" program.program_name as name,"
            query +=" program.program_description as description,"
            query +=" program_details.code as program,"
            query +=" program_details.isrunnable as runnable,"
            query +=" program_io.input as input,"
            query +=" program_io.output as output,"
            query +=" language.lang_name as language,"
            query +=" category.cat_name as category"
            query +=" from"
            query +=" program"
            query +=" INNER JOIN program_details ON program_details.program_id = program.id"
            query +=" INNER JOIN program_io ON program_io.program_details_id = program_details.id"
            query +=" INNER JOIN language ON language.id = program_details.lang_id"
            query +=" INNER JOIN category ON category.id = program.program_category_id"
            query +=" WHERE"
            query += " language.lang_name = 'Java'"

            if (err) {
                connection.release();
                throw err;
            }
            connection.query(query,function(err,rows){
                connection.release();
                var responseObject = {};
                if(rows && rows.length) {
                    responseObject.language     = programObject.language;
                    responseObject.category     = [];
                    responseObject.name         = [];
                    responseObject.desc         = [];
                    responseObject.program      = [];
                    responseObject.output       = [];
                    responseObject.input        = [];
                    responseObject.runnable     = [];

                    rows.filter(function (ele) {
                        responseObject.category.push(ele.category);
                        responseObject.name.push(ele.name);
                        responseObject.desc.push(ele.description);
                        responseObject.program.push(ele.program);
                        responseObject.output.push(ele.output);
                        responseObject.input.push(ele.input);
                        responseObject.runnable.push(ele.runnable);
                    })

                    responseObject.Message = "SUCCESS";
                    responseObject.Reason = "";

                    var insertQuery = "INSERT INTO requestlog (versionno, client, appname, language) VALUES ("+programObject.version+", '"+programObject.client+"', '"+programObject.app+"', '"+programObject.language+"')";
                    connection.query(insertQuery, function(err,rows){
                        if (err) throw err;
                        console.log("Record inserted");
                    });
                    res.send(responseObject);

                } else {
                    responseObject.language = "";
                    responseObject.category = [];
                    responseObject.name = [];
                    responseObject.desc = [];
                    responseObject.program = [];
                    responseObject.output = [];
                    responseObject.input = [];
                    responseObject.runnable = [];
                    responseObject.Message = "FAILURE";
                    responseObject.Reason = "Error Reason in an understandable text";
                    res.send(responseObject);
                }

            });
            connection.on('error', function(err) {
                throw err;
                return;
            });
        });
    }

}
