<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEntidadSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_entidad', function(Blueprint $table){
            $table->increments('id');
            $table->string('descripcion', 128);
        });

        Schema::create('entidad', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('tipo_e');
            $table->string('cod_e', 15)->index()->nullable();
            $table->boolean('activo_e')->default(true);
            $table->timestamps();
            $table->foreign('tipo_e')->references('id')->on('tipo_entidad');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('entidad');
        Schema::dropIfExists('tipo_entidad');
    }
}
