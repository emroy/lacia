<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cryptos extends Model
{
    protected $table = 'trading.cryptos';
    protected $primaryKey = 'id';
    public $timestamps = false;

    const MAIN = 31;

    public $fillable = [
        'base',
        'base_name',
        'marketcap',
        'estatus',
        'supply',
        'timestamp',
        'default_coin',
    ];

    /**
     * Metodo para guardar y actualizar diariamente las criptos
     * command -> \App\Console\Commands\updateCoins::class
     * @param json $data
     * @return boolean $response
     */
    public static function updateAndSave($data) {
        //Check if exists, if exists update else insert
        foreach($data->data as $d){
            $selected = self::where('base', $d->symbol)->first();            
            if($selected){
                $selected->update([
                    'marketcap' => (integer) $d->marketCapUsd,
                    'supply' => (integer) $d->supply,
                    'timestamp' => (string) $data->timestamp
                ]);
            } else {
                self::create([
                    'base' => (string) $d->symbol,
                    'base_name' => (string) $d->name,
                    'marketcap' => (string) $d->marketCapUsd,
                    'supply' => (string) $d->supply,
                    'timestamp' => (string) $data->timestamp
                ]);
            } 
        }
    }

    /**
     * Get an specific type list of coins
     * @param String $type
     * @return Array $data
     */
    public static function getType($type){
        if($type == "quote"){
            return self::where('estatus', true)
                ->get();
        } else if($type == "base"){
            return self::where('default_coin', true)
                ->where('estatus', true)
                ->get();
        }
    }

    /**
     * Cambia el estado de una crypto moneda
     * @param Request $request
     * @return array 
     */
    public static function change($request){
        return self::where('id',$request->id)->update([
            ($request->type == "habilitate") ? "estatus":"default_coin" => $request->switch
        ]);
    }

    /**
     * Obtener las monedas que estan activas
     * @param null
     * @return array 
     */
    public static function getActive(){
        return self::select('id','base')->where('estatus',true)->get()->toArray();
    }

}
