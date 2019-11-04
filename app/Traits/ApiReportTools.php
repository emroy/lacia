<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Exceptions\ReportLoaderException;
use App\Events\ReportSubmittedEvent;
use App\WorkerInfoData;
use App\WorkerInfoCampos;
use App\WorkerInfo;
use App\Worker;

trait ApiReportTools
{

    /**
     * Verificar que toda la data del request esta cubierta por una llave 'data'
     * @param Request $request 
     * @return Boolean
     */
    private function hasRightFormat(Request $request)
    {
        if(!$request->data){
            throw new ReportLoaderException('Formato del archivo incorrecto');
        }

        $this->data = json_decode($request->data);

        #TODO: Delete this line
        $this->data->fecha_ms = (integer) $this->data->fecha_ms;

        $validation = Validator::make((array) $this->data, [
            'id_e_locacion' => 'required|integer|exists:location,cod_location',
            'fecha_ms' => 'required|integer',
            'workers_info' => 'required|array', 
        ]);

        if($validation->fails()){
            throw new ReportLoaderException($validation->errors());
        }

        return true;
    }

    /**
     * Realizar procesamientos de validacion de cada worker_info_campos y captura de eventos en una sola iteración
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
     * Valida si el worker esta o no registrado, registra sus campos y sus nuevos valores
     * @param object $singleWorker
     * @param int $key
     */
    private function validateSingleWorker($singleWorker, $key){

        $worker = Worker::where('mac_address', $singleWorker->mac_address)->first();

        if(!$worker){
            $newWorker = new \stdClass();
            $newWorker->cod_serial = null;
            $newWorker->mac_address = $singleWorker->mac_address;
            $newWorker->hostname = $singleWorker->hostname;
            $newWorker->workername = null;
            $worker = $this->save(self::WORKER, $newWorker, true);
        }

        $this->registrateColumns($singleWorker->workers_chain_info, $worker);

    }

    /**
     * Registrar los campos de los workers
     * @param $chains_info
     * @param Worker $worker
     * @return void
     */
    private function registrateColumns($chains_info, Worker $worker)
    {
        foreach($chains_info as $key => $chain){ 
            $values = (array) $chain;
            foreach($values as $key => $campo){
                $this->handleCampo(strtolower($key), $campo, $chain, $worker->workerInfo);
            }
        }
    }

    /**
     * Guarda los campos en la base de datos si no existen y luego guarda su valor actual.
     * @param string $key
     * @param Array $campo
     * @param Array $chain
     * @param Array $workerInfo
     * @return void
     */
    private function handleCampo($key, $campo, $chain, $workerInfo)
    {
        $workerInfoDef = $this->getTrueWorkerInfo($workerInfo);

        if($key != 'chain_nro'){
            
            $newCampo = WorkerInfoCampos::where('nombre_campo_wic', $key)->first();

            if(!$newCampo){
                $newCampo = WorkerInfoCampos::create([
                    'tipo_wic' => (is_string($campo) ? 1:2),
                    'nombre_campo_wic' => $key,
                    'nombre_wic' => 'DESCONOCIDO',
                    'descripcion_wic' => 'DESCONOCIDO', 
                ]);
            }

            $newData = $newCampo->workerInfoData()->create([
                'chain_nro' => $chain->chain_nro,
                'id_wi' => $workerInfoDef->id,
                'fecha_ms' => $this->fecha_ms,
                'valor_wic' => $campo, 
            ]);

        }
    }

    /**
     * Devuelve la instancia de WorkerInfo que esta activa en el worker actual
     * @param Array $workerInfos 
     * @return WorkerInfo $f
     */
    private function getTrueWorkerInfo($workerInfos){
        foreach($workerInfos as $f){
            if($f->status){
                return $f;
            }
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