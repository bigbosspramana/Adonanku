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
            // Ambil semua idResep yang terkait dengan konversi ini dari pivot table
            $idResepList = DB::table('konversi_resep')
                ->where('idKonversi', $konversi->idKonversi)
                ->pluck('idResep');

            if ($idResepList->isEmpty()) {
                $this->command->info("Konversi id {$konversi->idKonversi} tidak punya resep terkait, lewati.");
                continue;
            }

            foreach ($idResepList as $idResep) {
                // Ambil bahan resep berdasarkan idResep
                $bahanReseps = DB::table('resep_bahan')
                    ->where('idResep', $idResep)
                    ->get();

                if ($bahanReseps->isEmpty()) {
                    $this->command->info("Resep id {$idResep} tidak punya bahan terkait, lewati.");
                    continue;
                }

                foreach ($bahanReseps as $bahanResep) {
                    $jumlahAsli = $bahanResep->jumlahBahan;
                    $jumlahHasil = $jumlahAsli * $konversi->jumlahKonversi;

                    DB::table('hasil_konversi')->updateOrInsert(
                        [
                            'idKonversi' => $konversi->idKonversi,
                            'idBahan' => $bahanResep->idBahan,
                        ],
                        [
                            'jumlahAsli' => $jumlahAsli,
                            'jumlahHasil' => $jumlahHasil,
                            'created_at' => Carbon::now(),
                            'updated_at' => Carbon::now(),
                        ]
                    );
                }
            }
        }
    }
}
