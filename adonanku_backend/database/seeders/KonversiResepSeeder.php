<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Konversi;

class KonversiResepSeeder extends Seeder
{
    public function run(): void
    {
        $konversis = Konversi::all();

        if ($konversis->isEmpty()) {
            $this->command->info('Data Konversi kosong, seed KonversiResep dilewati.');
            return;
        }

        foreach ($konversis as $konversi) {
            // Hanya resep yang sesuai dengan idResep di konversi yang boleh dimasukkan
            $idResepUtama = $konversi->idResep;

            // Misal kita tambahkan 1-2 kali hubungan ke resep yang sama (bisa disesuaikan)
            $jumlahRelasi = rand(1, 2);

            for ($i = 0; $i < $jumlahRelasi; $i++) {
                DB::table('konversi_resep')->updateOrInsert([
                    'idKonversi' => $konversi->idKonversi,
                    'idResep' => $idResepUtama,
                ], [
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
