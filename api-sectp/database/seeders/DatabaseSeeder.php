<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\UserType;
use App\Models\User;
use App\Models\FishTank;
use App\Models\Temperature;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        UserType::factory()->times(3)->create();
        User::factory(10)->create();
        FishTank::factory(10)->create();
        Temperature::factory(100)->create();
    }
}
