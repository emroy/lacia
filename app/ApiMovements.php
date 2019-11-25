<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ApiMovements extends Model
{
    protected $table = 'api_engine.api_movements';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'str_api',
        'cod_exchange',
        'estatus',
    ];

    public function params(){
        return $this->hasMany(ApiParamsOfMovement::class, 'cod_api_movement');
    }
}