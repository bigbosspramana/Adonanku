<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Bahan;
use App\Models\Inventory;
use App\Models\SatuanBahan;

class BahanSeeder extends Seeder
{
    public function run(): void
    {
        $bahanList = [
            ['namaBahan' => 'gula'],
            ['namaBahan' => 'tepung'],
            ['namaBahan' => 'telur'],
            ['namaBahan' => 'susu'],
        ];

        foreach ($bahanList as $item) {
            // Cari Inventory yang memiliki namaBahan yang sama
            $inventory = Inventory::where('namaBahan', $item['namaBahan'])->first();

            // Hanya buat Bahan jika inventory ditemukan
            if ($inventory) {
                Bahan::create([
                    'namaBahan'     => $item['namaBahan'],
                ]);
            }
        }
    }
}
