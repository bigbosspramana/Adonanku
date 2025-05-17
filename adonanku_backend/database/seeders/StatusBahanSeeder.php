<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StatusBahan; // Pastikan impor model ini

class StatusBahanSeeder extends Seeder
{
    public function run(): void
    {
        $statuses = ['habis', 'stok menipis', 'mendekati kadaluwarsa'];

        foreach ($statuses as $status) {
            StatusBahan::create([
                'status' => $status,
            ]);
        }
    }
}

