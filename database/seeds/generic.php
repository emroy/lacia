<?php

use Illuminate\Database\Seeder;
use App\TipoMovimiento;

class generic extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        TipoMovimiento::create([
            [
                'descripcion' => 'venta'
            ],
            [
                'descripcion' => 'compra'
            ]
        ])
    }
}
