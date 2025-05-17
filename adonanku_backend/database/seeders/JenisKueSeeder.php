<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\JenisKue;

class JenisKueSeeder extends Seeder
{
    public function run(): void
    {
        $jenis = ['kue kering', 'kue basah', 'kue kukus', 'kue panggang', 'cake', 'bolu', 'pastry'];

        foreach ($jenis as $nama) {
            JenisKue::create([
                'jenisKue'=> $nama,
            ]);
        }

    }
}
