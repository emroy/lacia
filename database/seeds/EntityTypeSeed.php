<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EntityTypeSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tipo_entidad')->insert([
            ['descripcion' => 'usuario'],
            ['descripcion' => 'maquina'],
            ['descripcion' => 'locacion'],
            ['descripcion' => 'componente'],
            ['descripcion' => 'evento'],
        ]);
    }
}
