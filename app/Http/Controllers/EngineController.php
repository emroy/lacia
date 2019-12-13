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

                $nonce = strtotime(date('d-m-Y H:m:s'));
                $key = decrypt($value['api_key']);
                $secret = decrypt($value['api_secret']);

                $r1 = exec("echo -n \"command=returnBalances&nonce={$nonce}\" | openssl sha512 -hmac {$secret}");
                $sign = trim(explode("=",$r1)[1]);
                
                $client = new Client([
                    'headers' => [
                        'Key' => $key,
                        'Sign' => $sign
                    ]
                ]);

                $r = exec("curl -X POST -d \"command=returnCompleteBalances&nonce={$nonce}\" -H \"Key:{$key}\" -H \"Sign:{$sign}\" https://poloniex.com/tradingApi");
        
                $response[$key] = $client->request('POST', $value['api_private'], ['body' => "command=returnCompleteBalances&nonce={$nonce}"]);
                $content = $response[$key]->getBody()->getContents();

                dd($content);

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

    }
}
