<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserProfileSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $entidad = \App\Entidad::create([
            'cod_e' => 'LOCACION_1',
            'tipo_e' => 3,
            'activo_e' => true,
        ]);

        $entidad->locacion()->create([
            'descripcion' => str_random(20),
            'nombre' => str_random(10),
            'cod_location' => '120000014'
        ]);

        DB::table('perfil')->insert([
            ['descripcion' => 'administrador'],
            ['descripcion' => 'tecnico'],
            ['descripcion' => 'propietario']
        ]);
    }
}
