<?php

namespace Database\Seeders;

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
            InventorySeeder::class,
        ]);
    }
}
