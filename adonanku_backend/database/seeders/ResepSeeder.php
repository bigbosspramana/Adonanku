<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Resep;
use App\Models\JenisKue;
use App\Models\CaraMasak;
use App\Models\User;

class ResepSeeder extends Seeder
{
    public function run(): void
    {
        $namaResepList = [
            'Kue Lapis Legit',
            'Kue Nastar',
            'Brownies Kukus',
            'Kue Lumpur',
            'Bolu Panggang',
            'Kue Putu Ayu',
            'Kue Cubit',
            'Kue Apem',
            'Bolu Kukus Mekar',
            'Kue Kering Cokelat'
        ];

        // Pastikan ada user, kalau belum ada, buat dulu
        if (User::count() === 0) {
            User::factory()->count(5)->create();
        }

        foreach ($namaResepList as $nama) {
            Resep::create([
                'namaResep'   => $nama,
                'idJenisKue'  => JenisKue::inRandomOrder()->first()->idJenisKue,
                'idCaraMasak' => CaraMasak::inRandomOrder()->first()->idCaraMasak,
                'idUser'      => User::inRandomOrder()->first()->id, // wajib isi idUser
                'isPublic'    => true, // optional, bisa diatur sesuai kebutuhan
                'durasiMasak' => rand(30, 120), // contoh durasi masak random antara 30-120 menit
            ]);
        }
    }
}
