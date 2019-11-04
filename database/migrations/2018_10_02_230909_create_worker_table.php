<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWorkerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('worker', function (Blueprint $table) {
            $table->integer('id_e');
            $table->primary('id_e');
            $table->char('cod_serial', 8)->nullable();
            $table->macAddress('mac_address')->index();
            $table->string('hostname', 15);
            $table->string('workername', 30)->nullable();
            $table->foreign('id_e')->references('id')->on('entidad');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('worker');
    }
}
