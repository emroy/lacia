<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Inversionista extends Model
{
    protected $table = 'trading.inversionista';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id_usuario'
    ];

    public function transaccion(){
        return $this->hasMany(Transaccion::class, 'id_inversionista');
    }

    public function usuario(){
        return $this->hasOne(Usuario::class, 'id_e');
    }

    public function balances(){
        return $this->hasMany(Balances::class, 'id_inversionista', 'id');
    }

    public function balance(){
        return Balances::where('id_inversionista', $this->id)->get();
    }

    /**
     * Toda la información de la página principal
     */
    public static function getMainData(){
        $mainBalance = Balances::selectRaw('quantity as fondos, trading.cryptos.*')
            ->join('trading.cryptos','trading.cryptos.id','=','trading.balances.id_coin')
            ->where('id_inversionista', Auth::user()->inversionista->id)
            ->get();
        return $mainBalance;
    }

    /**
     * Reducir los fondos de la cuenta de un inversionista
     * @param id id
     * @param quantity cantidad
     */
    public static function depositFounds($inv, $cantidad){

        if(!$inv){
            throw new \Exception('Error, inversionista inexistente');
        }

        if($inv->balances->count() == 0){
            
            $balance = $inv->balances()->create([
                'quantity' => $cantidad,
                'id_coin' => Cryptos::MAIN,
            ]);

        } else {
            
            $balance = Balances::where('id_inversionista', $inv->id)
                ->where('id_coin', Cryptos::MAIN)
                ->increment('quantity', $cantidad);
        }

        return $balance;
    }

    /**
     * Incrementar los fondos de la cuenta de un inversionista
     * @param id id
     * @param quantity cantidad
     */
    public static function withdrawFounds($inv, $cantidad){

        if(!$inv){
            throw new \Exception('Error, inversionista inexistente.');
        }

        if($inv->balances->count() == 0){
            
            throw new \Exception('Error, procedimiento erroneo. No existe un balance de moneda base');

        } else {
            
            $balance = Balances::where('id_inversionista', $inv->id)
                ->where('id_coin', Cryptos::MAIN)
                ->decrement('quantity', $cantidad);

        }

        return $balance;
    }

    /**
     * Toda la información pública de los inversionistas
     */
    public static function getAllUserData(){
        return self::select("usuario.active","usuario.correo","usuario.id_e",
            "inversionista.id as inversionista",
            "usuario.username","usuario.apelnomb")
            ->join('usuario','usuario.id_e','=','inversionista.id_usuario')
            ->get();
    }
}
