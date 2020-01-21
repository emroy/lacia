const { Postgres } = require('./conn.js');


module.exports = {

    /**
     * Funcion que trae todas las criptomonedas que tienen estatus true
     * @param null
     * @return Promise
     */
    Coins: async function() {
    
        var coins = [];
    
        await Postgres.connect();
    
        var r = await Postgres.query('SELECT * FROM trading.cryptos WHERE estatus = true');
    
        await Postgres.end();
    
        return r.rows;
    }
};

/*
Page design:
-Main slideshow
-Products: New Arrivals, Old products
-Hot products


Fonts for the page:

Athena for: London
Londrina Solid Thin: Main*/