<?php

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class ApiParams extends Model
{
    protected $table = 'api_engine.api_params';
    protected $primaryKey = 'id';
    public $timestamps = false;


    protected $fillable = [
        'id',
        'word',
        'descripcion',
        'estatus',  
    ];

    public function movements(){
        return $this->hasMany(ApiParamsOfMovement::class, 'cod_param');
    }

}
