<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\SaverTools;
use App\Inversionista;
use App\Movimientos;
use App\Transaccion;
use App\Usuario;
use App\Cryptos;
use App\ExchangeUsuario;

class InvestorController extends Controller
{
    use SaverTools;

    const USUARIO = 1;

    /**
     * Vista de nuevo inversor
     * @param Request
     * @return View
     */
    public function newAction(Request $request){
        return view('inversor.new');
    }

    /**
     * Nueva Transacción
     * @param Request
     * @return Json
     */
    public function newTransaction(Request $request) {

        try {

            $val = Validator::make($request->all(), [
                'type' => 'integer|required',
                'quantity' =>'numeric|required',
                'rate' => 'numeric|required',
                'fee' => 'numeric|required'
            ]);
    
            if($val->fails()){
                error_log($val->errors());
                throw new \Exception('Error de request');
            }

            DB::beginTransaction();

            Transaccion::newTransaction($request->all(), Auth::user());

            DB::commit();

            return response()->json(['success' => 'Transacción realizada exitosamente']);

        } catch(\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Nuevo movimiento entre cryptos
     * @param Request
     * @return Json
     */
    public function newMovement(Request $request) {

        try {

            $val = Validator::make($request->all(), [
                'type' => 'string|required',
                'quantity' =>'numeric|required',
                'rate' => 'numeric|required',
                'fee' => 'numeric|required',
                'base' => 'integer|required',
                'quote' => 'integer|required',
            ]);
    
            if($val->fails()){
                error_log($val->errors());
                throw new \Exception('Existen parametros invalidos');
            }

            if($request->base == $request->quote){
                throw new \Exception('No se puede realizar movimiento entre cryptomonedas iguales');
            }

            DB::beginTransaction();

            $mov = Movimientos::new($request, Auth::user());

            if(!$mov){
                throw new \Exception('Error de inserción en base de datos');   
            }

            DB::commit();

            return response()->json(['success' => 'Movimiento realizado exitosamente']);

        } catch(\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Ruta de la API para obtener toda la información general del Backend
     * @param void
     * @return Json
     */
    public function mainData(){

        $result = Inversionista::getMainData();
        return response()->json($result);

    }

    /**
     * Ruta de la API para guardar los inversionistas.
     * @param Request $request
     */
    public function saveAction(Request $request){

        try {
            $val = Validator::make($request->all(), [
                "nombre" => "required|string",
                "correo" => "required|email",
                "fondos" => "required|numeric",
            ]);
    
            if($val->fails()){
                throw new \Exception('Existen valores invalidos');
            }
    
            DB::beginTransaction();
    
            /**
             * Entidad creada exitosamente
             */
            $object = new \stdClass();
            $password = md5($request->correo.date('d-m-Y'));
            $object->apelnomb = $request->nombre;
            $object->correo = $request->correo;
            $object->username = $request->correo;
            $object->password = bcrypt($password);
            $usuario = $this->save(self::USUARIO, $object, true);

            $inv = new Inversionista();
            $inv->id_usuario = $usuario->id_e;
            $inv->save();

            $inv->balances()->create([
                'id_coin' => Cryptos::MAIN,
                'quantity' => $request->fondos,
            ]);
            
            DB::commit();

            return response()->json(['success' => 'Nuevo usuario creado exitosamente']);
        } catch(\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e->getMessage()]);
        }        
    }

    /**
     * Ruta de la API para obtener los inversionistas y su info
     * @param Request $request
     */
    public function getInversionistas(){
        $inv = Inversionista::getAllUserData();
        $inversionistas = $inv->toArray();
        foreach($inversionistas as $key => $i){
            $inversionistas[$key]['balances'] = $inv[$key]->balance();
        }
        return response()->json(Inversionista::getAllUserData()->toArray());
    }
    
    /**
     * Archivar una transacción
     * @param Request $request
     */
    public function archiveTransaction(Request $request){
        try {

            DB::beginTransaction();

            if(!$request->id){
                throw new \Exception('Error de parametros de request');
            }

            Transaccion::archive($request->id);

            DB::commit();

            return response()->json([
                'success' => 'Transacción Archivada'
            ]);
            

        } catch( \Exception $e) {

            DB::rollBack();
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    /**
     * Gets the information of all transactions from a single user.
     * @param Request $request
     * @return Json $reponse
     */
    public function getTransactions(Request $request){
        try {
            $data = Transaccion::getFromSingle(Auth::user()->inversionista->id);

            return response()->json(['data' => $data]);

        } catch( \Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    } 

    /**
     * Save exchange APIs
     * @param Request $request
     * @return Json $reponse
     */
    public function saveExchange(Request $request){
        try {
            if(!Auth::check()){
                throw new \Exception('No user logged in.');
            }
            
            $exchange = explode('-',$request->id_exchange);

            $ex = ExchangeUsuario::where(['id_usuario' => Auth::id(), 'id_exchange' => $exchange[1]])->first();

            if(!$ex){
                
                $res = Auth::user()->exchanges()->create([
                    'id_exchange' => $exchange[1],
                    'api_key' => encrypt($request->api_key),
                    'api_secret' => encrypt($request->api_secret),
                    'estatus' => 1
                ]);

                DB::commit();

                return response()->json([
                    'title' => 'Request Successful',
                    'message' => 'New API Key configured successfully',
                    'type' => 'success',
                ]);

            } else {

                $ex->update([
                    'api_key' => encrypt(trim($request->api_key)),
                    'api_secret' => encrypt(trim($request->api_secret)),
                    'estatus' => 1
                ]);

                DB::commit();

                return response()->json([
                    'title' => 'Request Successful',
                    'message' => 'New API Key has been updated',
                    'type' => 'success',
                ]);
            }

        } catch( \Exception $e) {
            DB::rollBack();
            return response()->json([
                'title' => 'Something has gone Wrong',
                'message' => $e->getMessage(),
                'type' => 'error',
            ]);
        }
    } 


}

