<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Resep;
use Illuminate\Support\Facades\DB;

class LangkahMasakSeeder extends Seeder
{
    public function run(): void
    {
        $reseps = Resep::all();

        foreach ($reseps as $resep) {
            $jumlahLangkah = rand(3, 6); // Jumlah langkah untuk tiap resep

            for ($i = 1; $i <= $jumlahLangkah; $i++) {
                DB::table('langkah_masak')->insert([
                    'idResep' => $resep->idResep,
                    'urutanMasak' => $i,
                    'deskripsi' => "Langkah {$i} untuk membuat {$resep->namaResep}.",
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
