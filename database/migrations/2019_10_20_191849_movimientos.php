<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Movimientos extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /*
            CREATE TABLE trading.movimientos(
                id serial,
                coin_quote integer not null,
                coin_base integer not null,
                quantity double precision not null,
                rate double precision not null,
                tipo_movimiento integer not null,
                estatus boolean default true,
                id_inversionista integer not null,
                PRIMARY KEY(id),
                FOREIGN KEY(coin_base) REFERENCES trading.cryptos(id),
                FOREIGN KEY(coin_quote) REFERENCES trading.cryptos(id),
                FOREIGN KEY(tipo_movimiento) REFERENCES trading.tipo_movimiento(id),
                FOREIGN KEY(id_inversionista) REFERENCES trading.inversionista(id)
            );
        */
        Schema::create('trading.movimientos', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('coin_quote')->references('id')->on('trading.cryptos');
            $table->integer('coin_base')->references('id')->on('trading.cryptos');
            $table->float('rate');
            $table->integer('tipo_movimientos')->references('id')->on('trading.tipo_movimiento');
            $table->foreign('id_inversionista')->references('id')->on('trading.inversionista');
            $table->boolean('estatus');
            $table->boolean('default_coin')->default(true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trading.movimientos');
    }
}
