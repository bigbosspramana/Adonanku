<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Bahan;

class BahanSeeder extends Seeder
{
    public function run(): void
    {
        $bahanList = [
            ['nama' => 'Gula'],
            ['nama' => 'Tepung'],
            ['nama' => 'Telur'],
            ['nama' => 'Susu'],
        ];

        foreach ($bahanList as $bahan) {
            Bahan::create([
                'namaBahan' => $bahan['nama'],
            ]);
        }
    }
}
