<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Balances extends Model
{
    protected $table = 'trading.balances';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public $fillable = [
        'id_coin',
        'quantity',
        'id_inversionista',
        'status',
        'default_coin'
    ];

    public function cryptos(){
        return $this->belongsTo(Cryptos::class, 'id_coin');
    }
}
