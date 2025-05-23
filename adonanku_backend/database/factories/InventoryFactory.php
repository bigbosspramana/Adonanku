<?php

namespace Database\Factories;

use App\Models\Inventory;
use App\Models\User;
use App\Models\StatusBahan;
use App\Models\JenisBahan;
use App\Models\JenisKemasan;
use App\Models\SatuanBahan;
use Illuminate\Database\Eloquent\Factories\Factory;

class InventoryFactory extends Factory
{
    protected $model = Inventory::class;

    public function definition(): array
    {
        return [
            // Generate random user ID
            'idUser' => User::all()->random()->id,

            // Generate random URL foto
            'url_foto' => 'https://via.placeholder.com/150', // Gambar placeholder

            // Generate random nama bahan (antara gula, tepung, telur, susu)
            'namaBahan' => $this->faker->randomElement(['gula', 'tepung', 'telur', 'susu']),

            // Generate random jumlah bahan
            'jumlahBahan' => $this->faker->numberBetween(1, 100),

            // Generate random jumlah satuan
            'jumlahSatuan' => $this->faker->numberBetween(1, 10),

            // Generate tanggal input mulai 1 bulan ke depan
            'tanggalInput' => $this->faker->dateTimeBetween('first day of next month', '+3 months')->format('Y-m-d'),

            // Generate tanggal exp mulai 1 bulan setelah tanggal input
            'tanggalExp' => $this->faker->dateTimeBetween('+2 months', '+6 months')->format('Y-m-d'),

            // Generate random status bahan ID (status_bahan_inventory)
            'idStatusBahan' => StatusBahan::all()->random()->idStatusBahan,

            // Generate random jenis bahan ID (jenis_bahan)
            'idJenisBahan' => JenisBahan::all()->random()->idJenisBahan,

            // Generate random satuan bahan ID (satuan_bahan)
            'idSatuanBahan' => SatuanBahan::all()->random()->idSatuanBahan,

            'idjenisKemasan' => JenisKemasan::all()->random()->idJenisKemasan,
        ];
    }
}
