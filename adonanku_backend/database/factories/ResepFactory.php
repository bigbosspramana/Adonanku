<?php

namespace Database\Factories;

use App\Models\Resep;
use App\Models\User;
use App\Models\JenisKue;
use App\Models\CaraMasak;
use Illuminate\Database\Eloquent\Factories\Factory;

class ResepFactory extends Factory
{
    protected $model = Resep::class;

    public function definition(): array
    {
        return [
            'idUser' => User::factory(),
            'namaResep' => $this->faker->words(3, true),
            'idJenisKue' => JenisKue::factory(),
            'idCaraMasak' => CaraMasak::factory(),
            'isPublic' => $this->faker->boolean,
            'durasiMasak' => $this->faker->numberBetween(10, 180), // durasi dalam menit
        ];
    }
}
