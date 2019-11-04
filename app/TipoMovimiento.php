<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TipoMovimiento extends Model
{
    protected $table = 'trading.tipo_movimiento';
    public $timestamps = false;

    protected $fillable = [
        'id','descripcion'
    ];

    public function movimientos(){
        $this->belongsTo(\App\Movimientos::class, 'tipo_movimiento');
    }
}
