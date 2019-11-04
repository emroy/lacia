<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Locacion extends Model
{
    protected $table = 'location';
    protected $primaryKey = 'id_e';
    public $timestamps = false;

    protected $fillable = [
        'id_e', 'descripcion','cod_location','nombre'
    ];

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }

    public function workerInfo(){
        return $this->hasMany(\App\WorkerInfo::class, 'id_locacion');
    }
}
