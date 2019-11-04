<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Exchange extends Model
{
    protected $table = 'trading.exchanges';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'estatus','description','url','api_url','api_private'
    ];

    public function cryptos(){
        return $this->hasMany(\App\ExchangeCoin::class, 'id_exchange');
    }

    public function usuarios(){
        return $this->hasMany(\App\ExchangeUsuario::class, 'id_exchange');
    }

}
