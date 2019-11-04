<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaccion extends Model
{
    protected $table = 'trading.transacciones';
    protected $primaryKey = 'id';
    public $timestamps = false;

    /**
     * Tipos de transacciones
     */
    const DEPOSITO = 2;
    const RETIRO = 1;
    const EXCHANGE = 3;

    protected $fillable = [
        'id_inversionista',
        'cantidad',
        'rate',
        'estatus',
        'costo_promedio',
        'fecha',
        'comision',
        'id_tipo_transaccion',
    ];

    public static function getFromSingle($id){
        return self::where('id_inversionista', $id)
            ->where('estatus', false)
            ->get()
            ->toArray();
    }

    /**
     * Metodo dinámico para cuando se realiza una nueva transacción de cualquier tipo
     * @param array $data
     * @param object $user
     * @return void
     */
    public static function newTransaction(array $data, \App\Usuario $usuario){
        
        if($data['type'] == self::DEPOSITO){

            $cp = self::getLastCost($data['rate'], self::DEPOSITO, $data['quantity'], $usuario->inversionista);
            
            /* CREAR LA NUEVA TRANSACCION */
            self::create([
                'id_inversionista' => $usuario->inversionista->id,
                'cantidad' => $data['quantity'],
                'rate' => $data['rate'],
                'comision' => $data['fee'],
                'costo_promedio' => $cp,
                'id_tipo_transaccion' => self::DEPOSITO,
            ]);

            /* COLOCAR AL USUARIO EL NUEVO COSTO PROMEDIO DE TRANSACCIONES GENERALES */

            $inv = $usuario->inversionista;
            $inv->costo_promedio = $cp;
            $inv->save();

            /* INCREMENTAR O DECREMENTAR EL BALANCE DEL USUARIO DEPENDIENDO DE LA TRANSACCION */
            Inversionista::depositFounds($usuario->inversionista, $data['quantity']);

        } else if($data['type'] == self::RETIRO){

            $cp = self::getLastCost($data['rate'], self::RETIRO, $data['quantity'], $usuario->inversionista);

            self::create([
                'id_inversionista' => $usuario->inversionista->id,
                'cantidad' => $data['quantity'],
                'rate' => $data['rate'],
                'comision' => $data['fee'],
                'costo_promedio' => $cp['trans'],
                'id_tipo_transaccion' => self::RETIRO,
            ]);

            $inv = $usuario->inversionista;
            $inv->costo_promedio = $cp['balance'];
            $inv->save();

            Inversionista::withdrawFounds($usuario->inversionista, $data['quantity']);

        } else if($data['type'] == self::MOVIMIENTO){

        }
    }

    /**
     * Obtiene el costo promedio de una transaccion
     * @param int $rate
     * @param int $type
     * @param int $cantidad
     * @param int $inversionsita
     */
    public static function getLastCost($rate, $type, $cantidad, $inv){

        $balance = $inv->balances()->where('id_coin',Cryptos::MAIN)->first();
        
        //Si la transaccion es una venta, el costo promedio se queda igual
        if($type == self::DEPOSITO){

            $newcp = (float) $rate;
            
            $oldcp = (float) $inv->costo_promedio;

            if($oldcp > 0){
                return ($oldcp + $newcp) / 2;
            } else {
                return $newcp;
            }

        } else if($type == self::RETIRO) {
            
            //Si la cantidad vendida es igual a la cantidad total. El costo promedio se vuelve 0
            if($balance->quantity == $cantidad){
                return 0;
            } else if($cantidad > $balance->quantity){
                throw new \Exception('Cantidad de transacción mayor a fondos disponibles');
            }
            
            return [
                'balance' => (!$inv->costo_promedio) ? 0:$inv->costo_promedio,
                'trans' => $inv->costo_promedio,
            ];
        }
    }

    /**
     * Archivar una transacción
     * @param id
     */
    public static function archive($id){
        return self::where('id', $id)->update([
            'estatus' => true
        ]);
    }

    public function inversionista(){
        return $this->belongsTo(\App\Inversionista::class, 'id');
    }
}
