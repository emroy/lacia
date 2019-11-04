<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Usuario extends Authenticatable
{
    use Notifiable;

    protected $table = 'usuario';
    protected $primaryKey = 'id_e';
    public $timestamps = false;

    protected $fillable = [
        'id_e','correo', 'password','active','username','apelnomb'
    ];

    protected $hidden = [
        'password',
    ];

    public function perfil(){
        return $this->perfil = $this->UsuarioPerfil[0]->id_perfil;
    }

    public function entidad(){
        return $this->BelongsTo(\App\Entidad::class, 'id');
    }

    public function UsuarioPerfil(){
        return $this->hasMany(\App\UsuarioPerfil::class, 'id_usuario');
    }

    public function inversionista(){
        return $this->hasOne(\App\Inversionista::class, 'id_usuario');
    }

    public function exchanges(){
        return $this->hasMany(\App\ExchangeUsuario::class, 'id_usuario');
    }
}
