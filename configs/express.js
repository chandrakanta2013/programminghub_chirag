/*********************************
 INITIALISATION AND REQUIRE MODULE
 *********************************/
var express     = require('express');
config          = require('./configs');
morgan          = require('morgan');
compress        = require('compression');
methodOverride  = require('method-override');
session         = require('express-session');
bodyParser      = require('body-parser');
cors            = require('cors');
mysql           = require('mysql');

/****************************
 MODULE OR APP INITIALISATION
 *****************************/
module.exports = function() {
    var app = express();

    if (process.env.NODE_ENV === 'development') {
        app.use(morgan('dev'));
    } else if (process.env.NODE_ENV === 'production') {
        app.use(compress({ threshold: 2 }));
    }

    app.use(bodyParser.urlencoded({
        extended: true
    }));

    app.use(bodyParser.json());

    app.use(methodOverride());

    app.use(cors());

    require('../app/routes/program.server.routes.js')(app, express);

    return app;
};
