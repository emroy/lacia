<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class startDaemon extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start {--option}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This commands sets up enviroment for the application to work appropriately';

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
        
    }
}
