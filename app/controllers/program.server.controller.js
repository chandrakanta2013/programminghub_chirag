/**********************
 MODULE INITIALISTAION
 **********************/
var programModel    = require('../models/program.server.model');

/*************
PROGRAM SAVE API
****************/
exports.saveprogram = function(req, res) {
    var programRequestObject = req.body;

    // Validating the fields
    if(programRequestObject) {
        if (!programRequestObject.programname && !programRequestObject.programcategory && !programRequestObject.code) {
            res.status(400);
            res.json({
                message: 'Please enter name, category and code'
            });
            return res;
        }

        // Calling model to insert data
        var modelStatus = programModel.saveprogramModel(programRequestObject);

        // Sending response
        if (modelStatus) {
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

        // Calling model to insert data
        programModel.getprogramModel(programObject, function (err, rows) {
            var responseObject = {};

            // Sending response
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
    }
}
