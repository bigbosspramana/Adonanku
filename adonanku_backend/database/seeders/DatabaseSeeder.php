<?php

namespace Database\Seeders;

use App\Models\CaraMasak;
use App\Models\HasilKonversi;
use App\Models\Inventory;
use App\Models\StatusBahan;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Jalankan semua seeder utama aplikasi.
     */
    public function run(): void
    {
        $this->call([
            UserSeeder::class,
            JenisBahanSeeder::class,
            StatusBahanSeeder::class,
            SatuanBahanSeeder::class,
            JenisKemasanSeeder::class,
            BahanSeeder::class,
            InventorySeeder::class,
            JenisKueSeeder::class,
            CaraMasakSeeder::class,
            ResepSeeder::class,
            ResepBahanSeeder::class,
            LangkahMasakSeeder::class,
            // KonversiSeeder::class,
            // KonversiResepSeeder::class,
            // HasilKonversiSeeder::class,
        ]);

        $this->command->info('Semua seeder berhasil dijalankan!');
    }
}
