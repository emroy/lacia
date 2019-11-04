<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    protected $table = 'item';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'tipo_item',
        'nombre_item',
        'marca_item',
        'modelo_item',
        'version_item',
        'descripcion_item',
        'barcode_item',
        'cantidad_item',
        'cod_serial_item',
    ];

    public function itemWorker(){
        return $this->hasMany(\App\ItemWorker::class, 'id_item');
    }
}
