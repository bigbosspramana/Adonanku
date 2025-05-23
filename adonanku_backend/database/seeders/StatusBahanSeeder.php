<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StatusBahan;

class StatusBahanSeeder extends Seeder
{
    public function run(): void
    {
        $statuses = [
            'Stok Habis',
            'Stok Menipis',
            'Stok Menipis, Mendekati Kadaluwarsa',
            'Sudah Kadaluwarsa',
            'Stok Aman, Mendekati Kadaluwarsa',
            'Aman',
        ];

        foreach ($statuses as $status) {
            StatusBahan::create([
                'status' => $status,
            ]);
        }
    }
}
