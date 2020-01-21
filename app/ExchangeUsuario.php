<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExchangeUsuario extends Model
{
    protected $table = 'trading.exchanges_usuario';
    public $timestamps = false;

    protected $fillable = [
        'id_usuario','id_exchange','estatus','api_key','api_secret'
    ];

    public function usuario(){
        return $this->belongsTo(\App\Usuario::class, 'id_e');
    }

    public function exchange(){
        return $this->belongsTo(\App\Exchange::class, 'id_exchange');
    }

    /**
     * Obtener todos los exchanges que tiene configurado un usuario.
     * @param integer $id del usuario
     * @return array $exchanges
     */
    public static function getPersonalExchanges($user){   
        return self::stant(
            self::select('api_key','api_secret','id_exchange')->where('id_usuario', $user->id_e)->get()->toArray()
        );
    }

    /**
     * Method to decrypt the api_keys and secrets
     * @param array $data
     * @return array $decrypted
     */
    protected static function stant(array $data){
        $new = [];
        foreach($data as $key => $d){
            $new[$key]['api_key'] = decrypt($d['api_key']);
            $new[$key]['api_secret'] = decrypt($d['api_secret']);
            $new[$key]['id_exchange'] = $d['id_exchange'];
        }
        return $new;
    }
}
