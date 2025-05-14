<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JenisBahan;

class JenisBahanSeeder extends Seeder
{
    public function run(): void
    {
        $jenis = ['kering', 'basah', 'bubuk'];

        foreach ($jenis as $nama) {
            JenisBahan::create([
                'jenisBahan' => $nama,
            ]);
        }
    }
}
