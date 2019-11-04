<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB as DataBase;
use \App\Inversionista;
use \App\Cryptos;
use \App\Balances;

class createBalances extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'create:balances';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command creates al balances for users that don`t have them';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        try {
            
            $i = Inversionista::doesntHave('balances')->get();

            $i->each(function($value, $counter) {
                $data = $value;
                $cryptos = Cryptos::where('estatus', true)->get();
                $cryptos->each(function($value2, $counter2) use ($data) {
                    $n = Balances::create([
                        'id_coin' => $value2->id,
                        'quantity' => 0,
                        'id_inversionista' => $data->id,
                        'status' => true,
                        'default_coin' => ($value2->base == 'BTC')  
                    ]);

                });
                
            });

            $this->info("Balances Created Successfully.");

        } catch(\Exception $e) {

            $this->info("Error: ".$e->getMessage());

        }
    }
}
