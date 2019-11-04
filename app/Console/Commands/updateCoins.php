<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use GuzzleHttp\Client as HttpClient;
use App\Cryptos;

class updateCoins extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'update:coins';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Executed Daily, its job is to update the coins database';

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
            
            $res = (new HttpClient())->request('GET', 'https://api.coincap.io/v2/assets');
            
            if($res->getStatusCode() != 200){
                throw new \Exception('Error de Request, response is not 200 - '.$res->getStatusCode());
            }

            $res = json_decode($res->getBody()->getContents());

            DB::beginTransaction();

            Cryptos::updateAndSave($res);

            DB::commit();

            $this->info("Process Completed, cryptocurrencies database updated at $res->timestamp");

        } catch(\Exception $e) {
            DB::rollBack();
            $this->info("Error: ".$e->getMessage());
        }
    }
}
