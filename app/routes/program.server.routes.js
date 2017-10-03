/*************************
 ROUTING DEFINED IN METHOD
 *************************/
module.exports = function (app, express) {

    let Program = require('../models/Program');

    let ProgramController = require('../controllers/ProgramController');
    let router = express.Router();

    router.get('/getProgram', (req, res) => {
        let programObj = (new ProgramController(new Program())).boot(req, res);
        return programObj.collection();
    });

    router.post('/saveProgram', (req, res) => {
        let programObj = (new ProgramController(new Program())).boot(req, res);
        return programObj.store();
    });

    app.use(config.baseApiUrl, router);
};