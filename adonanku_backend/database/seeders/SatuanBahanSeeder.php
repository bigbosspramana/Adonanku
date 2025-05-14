<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SatuanBahan;

class SatuanBahanSeeder extends Seeder
{
    public function run(): void
    {
        $statuses = ['kg', 'g', 'ml', 'l']; // Daftar satuan yang ada

        // Loop untuk membuat 10 data
        for ($i = 0; $i < 10; $i++) {
            // Pilih satuan secara acak
            $randomStatus = $statuses[array_rand($statuses)];

            // Buat data baru dengan satuan acak
            SatuanBahan::create([
                'satuan' => $randomStatus,
            ]);
        }
    }
}
