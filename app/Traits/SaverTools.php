<?php

namespace App\Traits;

use Illuminate\Http\Request;
use App\Exceptions\EntitySavingException;
use App\Entidad;
use App\Locacion;

trait SaverTools
{

    private static $types = [
        1 => ['saveUser','usuario'],
        2 => ['saveWorker','maquina'],
        3 => ['saveLocation','locacion'],
        3 => ['saveLocation','locacion'],
    ];

    public function save($type, $data, $active = null){
        $entidad = $this->saveEntity($type, $active);
        return $this->{
                self::$types[$type][0]
            }($data, $entidad);
    }

    public function saveEntity($type, $active = null){
        $counter = (integer) (Entidad::where('tipo_e', $type)->count() + 1);
        $name = strtoupper(self::$types[$type][1]. '_' .(string) $counter);
        return Entidad::create([
            'tipo_e' => $type,
            'cod_e' => $name,
            'activo_e' => ($active == null) ? true:false,
        ]);
    }

    private function saveUser($data, Entidad $entidad){
        $usuario = $entidad->usuario()->create([
            'apelnomb' => $data->apelnomb,
            'username' => $data->username,
            'password' => bcrypt($data->password),
            'active' => false,
            'correo' => $data->correo,
        ]);

        $usuario->UsuarioPerfil()->create([
            'id_perfil' => 4,
        ]);

        return $usuario;
    }
    
    private function saveWorker($data, Entidad $entidad){
        $worker = $entidad->worker()->create([
            'cod_serial' => $data->cod_serial,
            'mac_address' => $data->mac_address,
            'hostname' => $data->hostname,
            'workername' => $data->workername,
        ]);

        $location = Locacion::where('cod_location', $this->location)->first();

        $worker->workerInfo()->create([
            'id_location' => $location->id_e,
            'status' => true,
            'fecha_def' => 'now()',
        ]);

        return $worker;
    }

    private function saveLocation($data, Entidad $entidad){
        return $entidad->locacion()->create([
            'descripcion' => $data->detalle,
            'cod_location' => $data->codigo,
            'nombre' => $data->nombre,
        ]);
    }
}