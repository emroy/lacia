<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Worker extends Model
{
    protected $table = 'worker';
    protected $primaryKey = 'id_e';
    public $timestamps = false;

    protected $fillable = [
        'id_e', 'cod_serial','mac_address',
        'hostname','workername'
    ];

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }

    public function itemWorker(){
        return $this->hasMany(\App\ItemWorker::class, 'id_worker');
    }
    
    public function workerInfo(){
        return $this->hasMany(\App\WorkerInfo::class, 'id_worker');
    }

    public static function getWorkersForList(){
        return self::join('entidad', 'entidad.id', '=', 'worker.id_e')
            ->join('worker_info', 'worker_info.id_worker', '=', 'worker.id_e')
            ->join('location', 'location.id_e', '=', 'worker_info.id_location')
            ->select('worker.*','entidad.activo_e', 'location.cod_location')
            ->where('worker_info.status', true)
            ->orderBy('entidad.activo_e')
            ->get();
    }
}
