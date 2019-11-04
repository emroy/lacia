<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateItemSchema extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tipo_item', function(Blueprint $table){
            $table->increments('id');
            $table->string('descripcion', 128);
        });

        Schema::create('item', function(Blueprint $table){
            $table->increments('id');
            $table->integer('tipo_item');
            $table->string('nombre_item' , 128);
            $table->string('marca_item' , 128);
            $table->string('modelo_item', 128);
            $table->string('version_item', 128);
            $table->string('descripcion_item', 128);
            $table->string('barcode_item', 128);
            $table->string('cantidad_item', 128);
            $table->char('cod_serial_item',8);
            $table->foreign('tipo_item')->references('id')->on('tipo_item');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('item');
        Schema::dropIfExists('tipo_item');
    }
}
