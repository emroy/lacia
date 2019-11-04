<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Perfil extends Model
{
    protected $table = 'perfil';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'descripcion'
    ];

    public function usuarioPerfil(){
        return $this->hasMany(\App\UsuarioPerfil::class, 'id_perfil');
    }
}
