<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Exchange;
use App\Traits\EngineTools;

class EngineController extends Controller
{
    use EngineTools;
    
    /**
     * Ruta para los balances de usuario en los exchange
     * @param Request $request
     * @return Json $balances
     */
    public function balances(Request $request){
    
        try {

            //obtener informacion de usuario
            $usuario = Auth::user();
            
            //obtener los exchanges que el usuario tiene configurados
            $exchanges = $usuario->exchanges;
            
            //obtener todos los balances que tiene cada exchange
            $balances = [];
            
            foreach($exchanges as $key => $e){
                $balances[$key] = $this->ApiGet('get_all_balances',$e);
            }


            //eliminar todos los balances que son 0
            // $nonce = (string) round(microtime(true) * 3000).'000000';
            // $key = decrypt($value['api_key']);
            // $secret = decrypt($value['api_secret']);
            // $command = "command=returnOpenOrders&currencyPair=BTC_ETH&currencyPair=all"."&nonce={$nonce}";

            // $sign = hash_hmac('sha512',$command, $secret);

            // dd($sign);

            // $client = new Client([
            //     'headers' => [
            //         'Key' => $key,
            //         'Sign' => $sign,
            //     ]
            // ]);

            // $r = exec("curl -X POST -d \"{$command}\" -H \"Key:{$key}\" -H \"Sign:{$sign}\" https://poloniex.com/tradingApi");

            // dd(json_decode($r));

        } catch ( DecryptException $de) {

            error_log("Error de desencriptado: {$e->getMessage()}.");
            return response()->json([
                'error' => $e->getMessage()
            ]);

        } catch ( \Exception $e ) {
            
            return response()->json([
                'message' => $e->getMessage()
            ]);

        }

    }
}
