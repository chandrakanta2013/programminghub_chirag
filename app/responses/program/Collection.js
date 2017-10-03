class Collection {

    constructor(data) {
        this.data = data;
        this.response = {};
        this.response.language = "";
        this.response.category = [];
        this.response.name = [];
        this.response.desc = [];
        this.response.program = [];
        this.response.output = [];
        this.response.input = [];
        this.response.runnable = [];
        this.response.message = '';
        this.response.reason = '';
    }

    rows(data) {
        data.filter((row) => {
            this.response.category.push(row.category);
            this.response.name.push(row.name);
            this.response.desc.push(row.desc);
            this.response.program.push(row.program);
            this.response.input.push(row.input.split('-'));
            this.response.output.push(row.output.split('-'));
            this.response.runnable.push(row.runnable);
        });
        this.response.message = 'SUCCESS';
        return {statusCode: 200, data: this.response}
    }

    error(message) {
        this.response.message = 'FAILURE';
        this.response.reason = message;
        return {statusCode: 400, data: this.response}

    }
}

module.exports = Collection;