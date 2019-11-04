<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class Balances extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        /**
         * CREATE TABLE trading.balances(
         *       id serial,
         *       id_coin character varying(10),
         *       quantity double precision,
         *       status boolean default true,
         *       id_inversionista integer,
         *       default_coin boolean default false,
         *       PRIMARY KEY(id),
         *       FOREIGN KEY(id_inversionista) REFERENCES trading.inversionista(id)
         *   );
         */
        Schema::create('trading.balances', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('id_coin');
            $table->float('quantity');
            $table->integer('id_inversionista');
            $table->boolean('status');
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
        Schema::dropIfExists('trading.balances');
    }
}
