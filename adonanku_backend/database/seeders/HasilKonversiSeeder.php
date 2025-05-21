<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class HasilKonversiSeeder extends Seeder
{
    public function run()
    {
        $konversis = DB::table('konversi')->get();

        if ($konversis->isEmpty()) {
            $this->command->info('Data konversi kosong, seed data konversi dulu!');
            return;
        }

        foreach ($konversis as $konversi) {
            $bahanReseps = DB::table('resep_bahan')
                ->where('idResep', $konversi->idResep)
                ->get();

            if ($bahanReseps->isEmpty()) {
                $this->command->info("Resep id {$konversi->idResep} tidak punya bahan terkait, lewati.");
                continue;
            }

            foreach ($bahanReseps as $bahanResep) {
                $jumlahAsli = $bahanResep->jumlahBahan;

                $jumlahHasil = $jumlahAsli * $konversi->jumlahKonversi;

                DB::table('hasil_konversi')->insert([
                    'idKonversi' => $konversi->idKonversi,
                    'idBahan' => $bahanResep->idBahan,
                    'jumlahAsli' => $jumlahAsli,
                    'jumlahHasil' => $jumlahHasil,
                    'created_at' => Carbon::now(),
                    'updated_at' => Carbon::now(),
                ]);
            }
        }
    }
}
