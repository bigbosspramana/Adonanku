<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\CaraMasak;

class CaraMasakSeeder extends Seeder
{
    public function run(): void
    {
        $caraMasakList = [
            'Kukus',
            'Panggang',
            'Goreng',
            'Rebus',
            'Tumis',
            'Bakar',
        ];

        foreach ($caraMasakList as $cara) {
            CaraMasak::create([
                'caraMasak' => $cara,
            ]);
        }
    }
}
