<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JenisKemasan;

class JenisKemasanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jenis = ['bungkus', 'botol', 'kaleng'];

        foreach ($jenis as $nama) {
            JenisKemasan::create([
                'jenisKemasan' => $nama,
            ]);
        }
    }
}
