<?php

namespace App\Traits;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Events\ApiQueryEvent;
use App\Models\Api\ApiMovements;
use App\Models\Api\ApiMovementType;
use App\Models\Api\ApiParamsOfMovement;
use App\Models\Api\ApiParams;

trait EngineTools
{

    public $apiParams;

    /**
     * Obtener un recurso de la API
     * 
     * @param String $tipo eg: "single_balance"
     * @param \App\ExchangeUsuario $eu
     */
    public function ApiGet(String $tipo, \App\ExchangeUsuario $eu, $params = null)
    {
        try {
            
            $this->apiParams = $params;
            
            $type = ApiMovementType::where('descripcion', $tipo)->first();
            
            $movements = ApiMovements::where([
                "cod_exchange" => $eu->id_exchange,
                "id_type" => $type->id,
                "estatus" => true,
            ])->get();

            $movements = (array) $this->parseMovement($movements);
            
            foreach($movements as $key => $m){
                $movements[$key]['result'] = $this->APIQuery($m, $eu);
            }
            
            return $movements;

        } catch(\Exception $e){

            return ['error' => $e->getMessage()];

        }

    }

    /**
     * Realizar la consulta a la API seleccionada
     * 
     * @param Array $params
     * @param \App\ExchangeUsuario $eu
     */
    private function APIQuery($params, \App\ExchangeUsuario $eu){

        $base_uri = $eu->exchange->{($params["is_private"]) ? "api_private":"api_url"};

        if($params['hmac']){
            
            //$sign = hash_hmac($params['algo'],$params["parsed_string"], decrypt($eu->api_secret));

            $sign = trim(explode("=",
                exec(
                    "echo -n \"{$params['parsed_string']}\" | openssl sha512 -hmac {$eu->api_secret}"
                )
            )[1]);

            $r = json_decode(
                exec(
                    "curl -X POST -d \"{$params['parsed_string']}\" -H \"Key:{$eu->api_key}\" -H \"Sign:{$sign}\" {$base_uri}"
                )
            );

            dd($r);

            if($r->error){
                throw new \Exception($r->error);
            }

            return $r;

        } else {
            
            $client = new Client([
                'base_uri' => $base_uri
            ]);

            $response = $client->request('GET', $params['parsed_string'], [
                'data' => $params['parsed_string']
            ])->getBody()->getContents();

            return json_encode($response);

        }
    }


        /*$sign = trim(explode("=",$r1)[1]);

        //$r = exec("curl -X POST -d \"{$command}\" -H \"Key:{$key}\" -H \"Sign:{$sign}\" https://poloniex.com/tradingApi");

        //dd(json_decode($r));

    /**
     * Obtener todos los strings con expresiones evaluadas. 
     * 
     * @param Object $movements
     */
    private function parseMovement($movements){
        $mnew = $movements->toArray();
        foreach($movements as $key => $m) {
            $str = $m->str_api;
            $paramList = [];
            $m->movementParams->each(function($item, $key) use (&$paramList){
                $paramList[$key] = $item->params;
            });
            foreach($paramList as $key => $p){
                //Si el parametro no tiene una expresion de evaluación, se toma de los parametros enviados al request
                $str = str_replace(":{$p->word}:",(!$p->eval) ? $this->apiParams[$p->word]:eval($p->eval),$str);
            }
            $mnew[$key]['parsed_string'] = $str;
        }
        return $mnew;
    }

    /**
     * Obtener cuales son los parametros del string y parsearlos
     * 
     * @param Object $movement
     */
    private function getMovementParams($movement){
        return ApiParamsOfMovement::where('api_engine.api_movement_params.id_movement', $movement->id)
            ->join('api_engine.api_params','api_engine.api_movement_params.id','=','api_engine.api_params.id')
            ->get();
    }

    /**
     * Se encarga de redirigir que consulta se hara a que API especificamente.
     * 
     * @return Exception 
     * @return void
     */
    private function mainProcess()
    {

        $this->location = $this->data->id_e_locacion;

        $this->fecha_ms = $this->data->fecha_ms;

        foreach($this->data->workers_info as $key => $singleWorker){
            
            $this->validateSingleWorker($singleWorker, $key);

        }

    }


    /**
     * Lanzar el evento de nuevo reporte procesado en el canal de autenticacion del socket
     * @param Request $request 
     * @return void
     */
    public function triggerBroadcastEvent()
    {
        event(new ReportSubmittedEvent($this->fecha_ms, $this->location));
    }
}