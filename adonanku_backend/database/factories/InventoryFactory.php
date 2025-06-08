<?php

namespace Database\Factories;

use App\Models\Inventory;
use App\Models\User;
use App\Models\StatusBahan;
use App\Models\JenisBahan;
use App\Models\JenisKemasan;
use App\Models\SatuanBahan;
use App\Models\Bahan;
use Illuminate\Database\Eloquent\Factories\Factory;

class InventoryFactory extends Factory
{
    protected $model = Inventory::class;

    public function definition(): array
    {
        // Ambil data bahan random, jika kosong return null
        $bahan = Bahan::inRandomOrder()->first();
        $statusBahan = StatusBahan::inRandomOrder()->first();
        $jenisBahan = JenisBahan::inRandomOrder()->first();
        $satuanBahan = SatuanBahan::inRandomOrder()->first();
        $jenisKemasan = JenisKemasan::inRandomOrder()->first();

        return [
            'idUser' => User::inRandomOrder()->first()->id,

            'url_foto' => 'https://via.placeholder.com/150',

            'namaBahan' => $bahan ? $bahan->namaBahan : 'default bahan',

            'jumlahBahan' => $this->faker->numberBetween(1, 100),

            'jumlahSatuan' => $this->faker->numberBetween(1, 10),

            'tanggalInput' => $this->faker->dateTimeBetween('first day of next month', '+3 months')->format('Y-m-d'),

            'tanggalExp' => $this->faker->dateTimeBetween('+2 months', '+6 months')->format('Y-m-d'),

            'idStatusBahan' => $statusBahan ? $statusBahan->idStatusBahan : 1,

            'idBahan' => $bahan ? $bahan->idBahan : 1,

            'idJenisBahan' => $jenisBahan ? $jenisBahan->idJenisBahan : 1,

            'idSatuanBahan' => $satuanBahan ? $satuanBahan->idSatuanBahan : 1,

            'idJenisKemasan' => $jenisKemasan ? $jenisKemasan->idJenisKemasan : 1,
        ];
    }
}
