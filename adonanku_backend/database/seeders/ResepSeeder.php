<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Resep;
use App\Models\JenisKue;
use App\Models\CaraMasak;

class ResepSeeder extends Seeder
{
    public function run(): void
    {
        $namaResepList = [
            'Kue Lapis Legit',
            'Kue Nastar',
            'Brownies Kukus',
            'Kue Lumpur',
            'Bolu Panggang',
            'Kue Putu Ayu',
            'Kue Cubit',
            'Kue Apem',
            'Bolu Kukus Mekar',
            'Kue Kering Cokelat'
        ];

        foreach ($namaResepList as $nama) {
            Resep::create([
                'namaResep'   => $nama,
                'idJenisKue'  => JenisKue::inRandomOrder()->first()->idJenisKue,
                'idCaraMasak' => CaraMasak::inRandomOrder()->first()->idCaraMasak,
            ]);
        }
    }
}
