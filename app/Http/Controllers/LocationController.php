<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Exceptions\EntitySavingException;
use App\Traits\SaverTools;

class LocationController extends Controller
{
    use SaverTools;

    const LOCATION = 3;

    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Ruta para ver todas las locaciones y sus detalles
     * @param Request $request
     * @return View
     */
    public function index(Request $request)
    {
        return view('location.index');
    }

    /**
     * Ruta para agregar las nuevas locaciones
     * @param Request $request
     * @return View
     */
    public function newAction(Request $request)
    {
        return view('location.new');
    }

    /**
     * Ruta POST para guardar las locaciones
     * @param Request $request
     * @return View
     */
    public function saveAction(Request $request)
    {
        try {

            DB::beginTransaction();

            $validator = Validator::make($request->all(), [
                'nombre' => 'required|string',
                'codigo' => 'required|integer|unique:location,cod_location',
                'detalle' => 'required|string|between:1,128',
            ]);

            if($validator->fails()){
                throw new \EntitySavingException($validator->errors());
            }

            $locacion = $this->save(self::LOCATION, (object) $request->all());

            if(!$locacion){
                throw new \EntitySavingException('Error al guardar la entidad');
            }

            DB::commit();

            return response()->json([
                'success' => 'Se ha guardado la locación exitosamente'
            ]);

        } catch( \EntitySavingException $e ) {

            DB::rollBack();

            error_log('=================== LOCATION SAVE ERROR ====================');
            error_log($e->getMessage());

            return response()->json([
                'error' => $e->getMessage()
            ]);

        }
    }
}
