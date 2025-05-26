<?php

namespace Database\Factories;

use App\Models\Konversi;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class KonversiFactory extends Factory
{
    protected $model = Konversi::class;

    public function definition(): array
    {
        return [
            'namaKonversi' => $this->faker->word(),
            'jumlahKonversi' => $this->faker->randomFloat(5, 6, 10),
            'idUser' => User::factory(), // relasi dengan user
        ];
    }
}
