<?php

namespace App\Traits;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

trait RegisterTools
{
    /**
     * Me encargo de obtener los 'names' de los campos
     * y cambiarlos por hashes
     * @param array $labels
     * @return void
     */
    public function makeAndHash(array $labels, $str){
        $array = [];
        foreach($labels as $key){
            $array[$key] = $this->randomString();  
        }
        Session::put($str, $array);
        return $array;
    }

    /**
     * Genera un string random con la cantidad de caracteres
     * especificados
     * @param numeric $cantidad
     * @return String $string
     */
    private function randomString($cantidad = 30){
        $str = 'qwertyuiopasdfghjklzxcvbnm123456789';
        $string = '';
        for($i = $cantidad; $i > 0; $i--){
            $string .= $str[rand(0, 34)];
        }
        return $string;
    }

    /**
     * Transforma los hash iniciales, comprueba su generación, y devuelve los valores
     * @param Array $data
     * @return Array $labels
     */
    private function unravelHash(array $data = [], $type){
        //Se paso por el formulario con anteriordad
        if(!$array = Session::get($type)){
            throw new \Exception('Error de request');
        }

        $counter = 0;
        $arr = [];
        //verificar que todos los campos obtenidos existen en sesión
        foreach($data as $key => $data){
            if(!in_array($key, $array)){
                throw new \Exception('Error de request');
            }
            $arr[array_search($key, $array)] = $data;       
        }
        return $arr;
    }
}