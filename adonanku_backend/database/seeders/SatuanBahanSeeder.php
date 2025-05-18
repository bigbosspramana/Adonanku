<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\SatuanBahan;

class SatuanBahanSeeder extends Seeder
{
    public function run(): void
    {
        $statuses = ['kg', 'g', 'ml', 'l']; // Daftar satuan yang ada

        foreach($statuses as $nama) {
            SatuanBahan::create([
                'satuan' => $nama,
            ]);
        }
    }
}
