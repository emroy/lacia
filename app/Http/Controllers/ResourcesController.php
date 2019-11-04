<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Movimientos;
use App\Cryptos;
use App\Exchange;
use App\ExchangeUsuario;

class ResourcesController extends Controller
{
    /**
     * Obtener todas las cryptos en contexto del sistema
     * @param request $request
     * @return json $data
     */
    public function coins(Request $request){
        return response()->json([
            'base' => Cryptos::getType('base'),
            'quote' => Cryptos::getType('quote'),
        ]);
    }

    /**
     * Obtener todas las cryptos en contexto del sistema
     * @param request $request
     * @return json $data
     */
    public function movimientos(Request $request){
        return response()->json([
            'data' => Movimientos::getAll()
        ]);
    }

    /**
     * Obtener todos los exchanges que estan activos en la plataforma, para listarlos
     * @param request $request
     * @return json $data
     */
    public function exchanges(Request $request){
        
        if(Auth::user()->exchanges->isEmpty()){
            $response = [
                'data' => Exchange::select('color','image','description','id','url')->where('estatus', true)->get(),
            ];
        } else {
            $response = [
                'data' => Exchange::select('color','image','description','id','url')->where('estatus', true)->get(),
                'user' => ExchangeUsuario::getPersonalExchanges(Auth::user())   
            ];
        }

        return response()->json($response);
    }
}
