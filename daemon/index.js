const http = require('http');
const Fhandler = require('./files.js')
const { Coins } = require('./coins.js');
const { Config } = require('./params.js');
const API = require('./api.js');

/**
 * Funcion que se encarga de gestionar las consultas.
 * @param void
 * @return void
 */
const main = () => {
    try {

        var times = [];

        //Obtener cuales son las monedas que se van a consultar
        Coins().then(coins => {

            //Iterar los períodos permitidos para consultar cada uno.
            Object.keys(Config.timeframes).map(function(prop){
                
                times.push(setTimeout(function(){
                    
                    var data = API.query('rate', coins);
    
                    console.log(`Actualización del período ${prop} completado... Durmiendo.`);
    
                }), Config.timeframes[prop]);
    
            });

        });

    } catch(error) {
        console.log(error);
        process.exit();
    }

};

/**
 * Cliente HTTP para futuras funciones estadisticas.
 * 
 */


main();