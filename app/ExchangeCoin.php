<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class exchangeCoin extends Model
{
    protected $table = 'trading.exchange_coin';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id_coin','id_exchange','estatus'
    ];

    public function exchange(){
        return $this->belongsTo(\App\Models\Exchange::class, 'id');
    }
}
