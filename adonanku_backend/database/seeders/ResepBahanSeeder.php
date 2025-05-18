<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Resep;
use App\Models\Bahan;
use Illuminate\Support\Facades\DB;

class ResepBahanSeeder extends Seeder
{
    public function run(): void
    {
        $reseps = Resep::all();
        $bahanList = Bahan::all();

        foreach ($reseps as $resep) {
            // Ambil 2–5 bahan secara acak untuk setiap resep
            $bahanDipilih = $bahanList->random(rand(2, 4));

            foreach ($bahanDipilih as $bahan) {
                DB::table('resep_bahan')->insert([
                    'idBahan'      => $bahan->idBahan,
                    'idResep'      => $resep->idResep,
                    'jumlahBahan'  => rand(1, 10),
                    'created_at'   => now(),
                    'updated_at'   => now(),
                ]);
            }
        }
    }
}
