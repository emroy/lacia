<?php

use Illuminate\Database\Seeder;

class DefaultSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            EntityTypeSeed::class,
            UserProfileSeed::class,
            FirstUserSeed::class,
        ]);
    }
}