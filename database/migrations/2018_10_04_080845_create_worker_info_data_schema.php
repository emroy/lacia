<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkerInfoDataSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('worker_info_data', function(Blueprint $table) {
            $table->increments('id');
            $table->smallInteger('chain_nro');
            $table->integer('id_wic');
            $table->integer('id_wi');
            $table->string('fecha_ms')->index();
            $table->string('valor_wic', 128)->comment('Puede ser un numero o un string, debe ser convertido segun sea el caso');
            $table->foreign('id_wic')->references('id')->on('worker_info_campos');
            $table->foreign('id_wi')->references('id')->on('worker_info');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('worker_info_data');
    }
}
