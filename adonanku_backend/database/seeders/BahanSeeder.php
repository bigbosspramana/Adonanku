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
            ['namaBahan' => 'Gula', 'jumlahBahan' => 500],
            ['namaBahan' => 'Tepung', 'jumlahBahan' => 1000],
            ['namaBahan' => 'Telur', 'jumlahBahan' => 12],
            ['namaBahan' => 'Susu', 'jumlahBahan' => 250],
        ];

        foreach ($bahanList as $item) {
            // Cari Inventory yang memiliki namaBahan yang sama
            $inventory = Inventory::where('namaBahan', $item['namaBahan'])->first();

            // Hanya buat Bahan jika inventory ditemukan
            if ($inventory) {
                Bahan::create([
                    'namaBahan'     => $item['namaBahan'],
                    'jumlahBahan'   => $item['jumlahBahan'],
                    'idSatuanBahan' => SatuanBahan::inRandomOrder()->first()->idSatuanBahan,
                    'idInventory'   => $inventory->idInventory,
                ]);
            }
        }
    }
}
