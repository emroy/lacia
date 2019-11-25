<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Movimientos extends Model
{
    protected $table = 'trading.movimientos';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'coin_quote',
        'coin_base',
        'quantity',
        'rate',
        'tipo_movimiento',
        'estatus',
        'id_inversionista',
    ];

    private static $buy = 1;
    private static $sell = 2;

    /**
     * Archivar una transacción
     * @param id el valor
     * @param key el identificador
     * @return void
     */
    public static function archive($id, $key = 'id'){
        return self::where($key, $id)->update([
            'estatus' => true,
        ]);
    }

    /**
     * Realizar un nuevo movimiento
     * @param array $data
     * @param User $usuario
     */
    public static function new($request, $user){
        return self::create([
            'coin_quote' => $request->quote,
            'coin_base' => $request->base,
            'quantity' => $request->quantity,
            'rate' => $request->rate,
            'tipo_movimiento' => self::${$request->type},
            'estatus' => true,
            'id_inversionista' => $user->inversionista->id
        ]);
    }

    /**
     * Obtener todos los movimientos que no han sido archivados
     * @param void
     * @param array $data
     */
    public static function getAll(){
        if(Auth::check()){
            return self::where('estatus', true)
                ->where('id_inversionista', Auth::user()->inversionista->id)
                ->get()
                ->toArray();
        }
    }

    public function tipo(){
        return $this->hasOne(\App\TipoMovimiento::class, 'id');
    }

    public function base(){
        return $this->hasOne(\App\Cryptos::class, 'coin_base');
    }

    public function quote(){
        return $this->hasOne(\App\Cryptos::class, 'coin_quote');
    }

    public function inversionista(){
        return $this->hasMany(\App\inversionista::class, 'id_inversionista');
    }
}
