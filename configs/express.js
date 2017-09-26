/*********************************
 INITIALISATION AND REQUIRE MODULE
 *********************************/
var express     = require('express');
config          = require('./configs');
bodyParser      = require('body-parser');
cors            = require('cors');
mysql           = require('mysql');

/****************************
 MODULE OR APP INITIALISATION
 *****************************/
module.exports = function() {
    var app = express();

    app.use(bodyParser.urlencoded({
        extended: true
    }));

    app.use(bodyParser.json());

    app.use(cors());

    require('../app/routes/program.server.routes.js')(app, express);

    return app;
};
