<?php 

namespace App\Models\Api;

use Illuminate\Database\Eloquent\Model;

class ApiMovementType extends Model
{
    protected $table = 'api_engine.type_query';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'descripcion',
    ];
}