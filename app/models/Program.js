let {connection} = require('../../configs/mysql');

class Program {

    get(data) {

        data.from = (typeof data.from === "undefined") ? null : data.from;
        data.to = (typeof data.to === "undefined") ? null : data.to;

        let table = [data.version, data.client, data.app, data.language, data.from, data.to];


        // Executing Db query
        return new Promise((resolve, reject) => {

            // Preparing queries and calling store procedures
            let query = "CALL get_program(?,?,?,?,?,?); SELECT @error_message;";
            let queryResult = mysql.format(query, table);

            connection.query(queryResult, function (err, rows) {
                let error = rows.pop();
                if (error[0]['@error_message']) {
                    reject(error[0]['@error_message']);
                }

                let response = rows[0];
                if (err) {
                    reject(err.message);
                } else {
                    resolve(response);
                }
            });
        });

    }

    save(data) {

        data.difficultylevel = (typeof data.difficultylevel === 'undefined') ? 1 : data.difficultylevel;
        data.Isrunnable = (typeof data.Isrunnable === 'undefined') ? 'N' : data.Isrunnable;
        data.inputOutput = null;
        data.inputOutputLength = null;
        if (data.input instanceof Array && data.output instanceof Array) {
            let inputOutput = '';
            for (let i = 0; i < data.input.length; i++) {
                let input = data.input[i];
                let output = (typeof data.output[i] !== 'undefined') ? data.output[i] : '';
                inputOutput += "('::PD_ID::', '" + input + "', '" + output + "')";
                if (i < (data.input.length - 1)) {
                    inputOutput += ",";
                }
            }
            data.inputOutput = inputOutput;
        }


        let table = [
            data.programname, data.programdescription, data.programcategory, data.programlanguage, data.descimagebase64,
            data.descimageurl, data.code, data.exampleoutput, data.difficultylevel, data.Isrunnable,
            data.inputOutput
        ];


        // Executing Db query
        return new Promise((resolve, reject) => {

            // Preparing queries and calling store procedures
            let query = "CALL save_program(?,?,?,?,?,?,?,?,?,?,?); SELECT @error_message;";
            let queryResult = mysql.format(query, table);

            connection.query(queryResult, function (err, rows) {
                let error = rows[1];
                if (error[0]['@error_message']) {
                    reject(error[0]['@error_message']);
                }

                if (err) {
                    reject(err.message);
                } else {
                    resolve(rows[0]);
                }
            });
        });
    }
}

module.exports = Program;