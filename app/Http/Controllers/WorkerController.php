<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Worker;
use App\Entidad;

class WorkerController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Ruta para mostrar todos los workers existentes, por autenticar y sin autenticar
     * Este modulo utiliza AngularJS
     * @param Request $request
     * @return View
     */
    public function index(Request $request)
    {
        return view('worker.index');
    }

    /**
     * Ruta para crear nuevo worker
     * Este modulo utiliza AngularJS
     * @param Request $request
     * @return View
     */
    public function newAction(Request $request)
    {
        return view('worker.new');
    }

    /**
     * Esta API devuelve todos los workers ordenados del menos actualizado al mas actualizado
     * @param Request $request
     * @return Response $jsonResponse
     */
    public function workerListApi(Request $request){

        return response()->json([
            'workers' => Worker::getWorkersForList(),
        ]);
        
    }

    /**
     * Actualizar los Workers cuando apenas se han agregado por la api
     * @param Request $request
     * @return Response $jsonResponse
     */
    public function updateActionFirst(Request $request){
        try {

            $v = Validator::make($request->all(), [
                "mac_address" => "required|string",
                "serial" => "required|string",
                "workername" => "required|string",
                "hostname" => "required|string",
                "id" => "required|integer",
            ]);

            if($v->fails()){
                throw new \Exception('Error de validación');
            }

            $entity = Entidad::find($request->id);
            $entity->activo_e = true;
            $entity->save();

            $worker = Worker::find($request->id);
            $worker->mac_address = 
            $worker->mac_address = $request->mac_address;
            $worker->cod_serial = $request->serial;
            $worker->workername = $request->workername;
            $worker->hostname = $request->hostname;
            $worker->save();

            return response()->json([
                'success' => [
                    'title' => 'Se ha modificado exitosamente el registro de worker',
                    'response' => $worker->toArray()
                ]
            ]);

        } catch(\Exception $e) {
            
            return response()->json([
                'error' => $e->getMessage()
            ]);

        }
    }
}
