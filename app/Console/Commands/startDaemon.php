<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Helpers\Process;
use Illuminate\Support\Facades\Storage;

class startDaemon extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start:daemon';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will start the data flux daemon';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
    * Execute the console command.
    * NOTE:
    * Hay que obtener cuales son los parametros para la ejecución de un Daemon Dinamico.
    * Tiene que recibir cuales son las criptomonedas que estan activas para recibir constantemente la actualización
    * por Websocket
    * Además de eso tambien hay que actualizar los valores de esas monedas todos los días y mantener un log con al menos 50 dias de registros con periodos de cada hora
    * 1 dia [cada 1 HORA { cada 10 minutos}]
    * @Reporte de dia, reporte de las horas dentro del dia, reporte de cada 10 minutos dentro de cada hora.
    * ¿Que debe tener cada reporte?
    * @return mixed
    */
    public function handle()
    {

        $this->info('Starting Daemon...');

        $string = self::getParsedParams();

        $daemon = env('DAEMON_LOCK');
        echo exec("node {$daemon} {$string}");

        $this->info('Daemon has started on server');
    }

    /**
     * Construir el JSON para el Daemon
     * @param null
     * @return string 
     */
    protected static function getParsedParams(){

        $array = [
            "default_exchange" => \App\Exchange::getDefault(),
            "coins" => \App\Cryptos::getActive(),
            "storage_type" => env('DAEMON_STORAGE'),
            "data_src" => env('DAEMON_SRC'),
            "data_cadence" => [
                "low" => "10min",
                "med" => "1day",
                "high" => "1month",
            ],
            "max_big_number" => 10,
        ];

        $string = ``;

        foreach($array as $key => $value){
            if(!is_array($value)){
                $string .= "{$key}={$value} ";
            } else {

                $temp = "";
                foreach($value as $k => $v){
                    if(is_array($v)){
                        foreach($v as $provk => $provv){
                            $temp .= "{$provk}:{$provv},";    
                        }
                    } else {
                        $temp .= "{$k}:{$v},";
                    }
                }
                $string .= "{$key}={$temp} ";
            }
        }
        return $string;
    }
}
