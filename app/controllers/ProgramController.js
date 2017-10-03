let Collection = require('../responses/program/Collection');

class ProgramController {

    constructor(repo) {
        this.repo = repo;
    }

    boot(req, res) {
        this.req = req;
        this.res = res;
        return this;
    }

    collection() {

        let collection = new Collection();

        if (!this.req.query.client || !this.req.query.language) {
            let response = collection.error('Please enter client and language');
            this.res.status(response.statusCode);
            return this.res.send(response.data);
        }

        this.repo.get(this.req.query).then((rows) => {
            let response = collection.rows(rows);
            this.res.status(response.statusCode);
            this.res.send(response.data);
        }).catch((err) => {
            let response = collection.error(err);
            this.res.status(response.statusCode);
            this.res.send(response.data);
        });
    }

    store() {

        let data = this.req.body.data;

        if (!data.programname
            || !data.programcategory
            || !data.programlanguage
            || !data.code
        ) {
            this.res.status(400);
            return this.res.send({
                message: "FAILURE",
                reason: "Please enter program name, program category, program language, and program code."
            });
        }

        this.repo.save(data).then(() => {
            this.res.send({
                message: "SUCCESS",
                reason: ""
            });
        }).catch((err) => {
            this.res.send({
                message: "FAILURE",
                reason: err
            });
        });

    }
}

module.exports = ProgramController;