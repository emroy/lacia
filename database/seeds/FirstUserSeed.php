<?php

use Illuminate\Database\Seeder;
use App\Usuario;
use App\Entidad;

class FirstUserSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // ryan
        $entidad = Entidad::create([
            'tipo_e' => 1,
            'cod_e' => 'USUARIO_1',
            'activo_e' => true
        ]);
        
        $usuario = new Usuario;
        $usuario->correo = 'snavarro169@gmail.com';
        $usuario->password = bcrypt('123456');
        $usuario->username = 'rphilbert';
        $usuario->active = true;
        $usuario->apelnomb = 'Ryan Philbert';
        $entidad->usuario()->save($usuario);

        DB::table('usuario_perfil')->insert([
            'id_usuario' => $usuario->id_e,
            'id_perfil' => 1,
        ]);

        //orestes
        $entidad = Entidad::create([
            'tipo_e' => 1,
            'cod_e' => 'USUARIO_2',
            'activo_e' => true
        ]);
        
        $usuario = new Usuario;
        $usuario->correo = 'orestesm20@gmail.com';
        $usuario->apelnomb = 'Orestes Gutierrez';
        $usuario->password = bcrypt('123456');
        $usuario->username = 'ogutierrez';
        $usuario->active = true;
        $entidad->usuario()->save($usuario);
        
        DB::table('usuario_perfil')->insert([
            'id_usuario' => $usuario->id_e,
            'id_perfil' => 1,
        ]);
    }
}
