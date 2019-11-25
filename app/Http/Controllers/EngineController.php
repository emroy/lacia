<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Exchange;

class EngineController extends Controller
{
    /**
     * Ruta para los balances de usuario en los exchange
     * @param Request $request
     * @return Json $balances
     */
    public function balances(Request $request){
    
        try {

            $exchanges = Exchange::getAvailablesForEngine();

            if(!$exchanges){
                throw new \Exception(0);
            }


            foreach($exchanges as $key => $value){
                $client = new Client(['base_uri' => (string) $value['api_private']]);

                $response[$key] = $client->request('POST', 'command=returnBalances&nonce=154264078495300',[
                    'Key' => decrypt($value['api_key']),
                    'Sign' => decrypt($value['api_secret'])
                ]);

                dump($response[$key]);
            }   

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


/*
        curl -X POST \
     -d "command=returnBalances&nonce=154264078495300" \
     -H "Key: 7BCLAZQZ-HKLK9K6U-3MP1RNV9-2LS1L33J" \
     -H "Sign: 2a7849ecf...ae71161c8e9a364e21d9de9" \
     https://poloniex.com/tradingApi*/
    }
}
