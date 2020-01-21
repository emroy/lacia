const { Client } = require('pg');

module.exports = {

    /**
     * @instance local
     */
    Postgres: new Client({
        user: 'postgres',
        host: '127.0.0.1',
        database: 'mineria',
        password: '010997',
        port: 5432,
    }),
    

}