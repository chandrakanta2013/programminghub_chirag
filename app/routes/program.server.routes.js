/*************************
 ROUTING DEFINED IN METHOD
 *************************/
module.exports = function(app, express) {
    var program = require('../controllers/program.server.controller');
    var router = express.Router();

    router.post('/saveprogram', program.saveprogram);
    router.post('/getprogram', program.getprogram);

    app.use(config.baseApiUrl, router);
};