<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ItemWorker extends Model
{
    protected $table = 'item_worker';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id_worker',
        'id_item',
    ];

    public function items(){
        return $this->belongsTo(\App\Item::class, 'id');
    }

    public function workers(){
        return $this->belongsTo(\App\Worker::class, 'id_e');
    }
}
