<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Konversi;
use App\Models\Resep;

class KonversiResepSeeder extends Seeder
{
    public function run(): void
    {
        $konversis = Konversi::all();
        $resepIds = Resep::pluck('idResep')->toArray();

        if ($konversis->isEmpty() || empty($resepIds)) {
            $this->command->info('Data Konversi atau Resep kosong, seed KonversiResep dilewati.');
            return;
        }

        foreach ($konversis as $konversi) {
            // Pilih 1 resep random
            $randomResepId = collect($resepIds)->random();

            // Insert data pivot satu resep untuk satu konversi
            DB::table('konversi_resep')->updateOrInsert([
                'idKonversi' => $konversi->idKonversi,
                'idResep' => $randomResepId,
            ], [
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
