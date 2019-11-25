<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Exchange extends Model
{
    protected $table = 'trading.exchanges';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'estatus','description','url','api_url','api_private'
    ];

    public static function getAvailablesForEngine(){

        return self::select('trading.exchanges.description','trading.exchanges.api_private','trading.exchanges.default_exchange','trading.exchanges_usuario.api_key','trading.exchanges_usuario.api_secret')
            ->join('trading.exchanges_usuario','trading.exchanges_usuario.id_exchange','trading.exchanges.id')
            ->where([
                'trading.exchanges.estatus' => true,
                'trading.exchanges_usuario.id_usuario' => Auth::user()->id_e
            ])
            ->get()
            ->toArray();
    }

    public function cryptos(){
        return $this->hasMany(\App\ExchangeCoin::class, 'id_exchange');
    }

    public function usuarios(){
        return $this->hasMany(\App\ExchangeUsuario::class, 'id_exchange');
    }

    public static function getDefault(){
        return self::select('id','description')->where('default_exchange', true)->first()->toArray();
    }

}
