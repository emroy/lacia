<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class WorkerInfo extends Model
{
    protected $table = 'worker_info';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id_location', 'status','id_worker','fecha_def'
    ];

    public function workerInfoData(){
        return $this->hasMany(\App\WorkerInfoData::class, 'id_wi');
    }

    public function location(){
        return $this->belongsTo(\App\Locacion::class, 'id_e');
    }
}
