<?php

namespace App\Models\Api;

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
        'hmac',
        'is_private',
    ];

    public function movementParams(){
        return $this->hasMany(ApiParamsOfMovement::class, 'cod_api_movement');
    }
}