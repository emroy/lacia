<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkerInfoSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('worker_info', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('id_location');
            $table->integer('id_worker');
            $table->boolean('status')->comment('Si es true: esta activo actualmente, Si es false: la maquina fue movida de la locación');
            $table->date('fecha_def');
            $table->foreign('id_location')->references('id_e')->on('location');
            $table->foreign('id_worker')->references('id_e')->on('worker');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('worker_info');
    }
}
