<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use App\Cryptos;

class AdminController extends Controller
{
    /**
     * Página Principal
     * @param Request $request
     */
    public function index(Request $request){
        return view('admin.index');
    }

    /**
     * Get all cryptos
     * @param Request $request
     */
    public function getCryptos(Request $request){
        return response()->json([
            'data' => Cryptos::all()->toArray()
        ]);
    }

    /**
     * Change Cryptos status
     * @param Request $request
     */
    public function activateCrypto(Request $request){
        
        try {

            DB::beginTransaction();

            $val = Validator::make($request->all(), [
                'type' => 'string|required',
                'switch' =>'string|required',
                'id' =>'required|integer',
            ]);

            if($val->fails()){
                throw new \Exception($val->errors());
            }

            $result = Cryptos::change($request);

            DB::commit();

            return response()->json([
                'success' => 'Crypto modificada exitosamente'
            ]);

        } catch(\Exception $e) {

            DB::rollBack();
            error_log($e->getMessage());
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }

    }
}
