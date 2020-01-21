<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class ApiParamsOfMovement extends Model
{
    protected $table = 'api_engine.api_movement_params';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'cod_param',
        'cod_api_movement',
        'estatus'  
    ];

    /**
     * Tiene varios parametros pertenecientes a varios movimientos
     * @param null
     * @return relation
     */
    public function params(){
        return $this->belongsTo(ApiParams::class, 'id');
    }

    /**
     * Un movimiento puede tener muchos parametros
     * @param null
     * @return relation
     */
    public function movements(){
        return $this->belongsTo(ApiMovements::class, 'id');
    }

}
