<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Resep;
use Illuminate\Support\Facades\DB;
use App\Models\User;

class KonversiSeeder extends Seeder
{
    public function run(): void
    {
        $users = User::all();
        $reseps = Resep::all();

        if ($users->isEmpty() || $reseps->isEmpty()) {
            $this->command->info('Users or Resep data is empty, skipping KonversiSeeder');
            return;
        }

        // Contoh data konversi, bisa kamu ubah sesuai kebutuhan
        $konversiSamples = [
            ['namaKonversi' => '1 ke 5 porsi', 'jumlahKonversi' => 5],
            ['namaKonversi' => '1 ke 10 porsi', 'jumlahKonversi' => 10],
            ['namaKonversi' => '1 ke 20 porsi', 'jumlahKonversi' => 20],
        ];

        foreach ($reseps as $resep) {
            foreach ($konversiSamples as $konversi) {
                DB::table('konversi')->insert([
                    'namaKonversi' => $konversi['namaKonversi'],
                    'jumlahKonversi' => $konversi['jumlahKonversi'],
                    'idUser' => $users->random()->id,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
