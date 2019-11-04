<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkerInfoCampos extends Model
{
    protected $table = 'worker_info_campos';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'tipo_wic', 'nombre_wic', 'nombre_campo_wic', 'descripcion_wic'
    ];

    public function workerInfoData(){
        return $this->hasMany(\App\WorkerInfoData::class, 'id_wic');
    }

}
