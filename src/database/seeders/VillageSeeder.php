<?php

namespace Database\Seeders;

use App\Models\Village;
use Illuminate\Database\Seeder;

class VillageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        foreach (range(1, 100) as $index) {
            $districtId = rand(1, 100) % 2 === 0 ? 1 : 2;

            Village::factory()->create(['district_id' => $districtId]);
        }
    }
}
