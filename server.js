/********************
 ENVIRONMENT SETTING
 ********************/
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

/*********************************
 INITIALISATION AND REQUIRE MODULE
 *********************************/
var exp 		= require('express');
var config 		= require('./configs/configs');
var express 	= require('./configs/express');
var mysql 		= require('./configs/mysql');
var app 		= express();

/************
 LISTEN PORT
 ************/
app.listen(config.serverPort);
console.log('Server running at http://localhost:' + config.serverPort + '/');
