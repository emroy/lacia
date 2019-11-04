<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Entidad extends Model
{
    protected $table = 'entidad';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'id','tipo_e', 'cod_e', 'activo_e',
    ];

    public function usuario(){
        return $this->hasOne(\App\Usuario::class, 'id_e');
    }

    public function worker(){
        return $this->hasOne(\App\Worker::class, 'id_e');
    }

    public function item(){
        return $this->hasOne(\App\Item::class, 'id_e');
    }

    public function locacion(){
        return $this->hasOne(\App\Locacion::class, 'id_e');
    }
}
