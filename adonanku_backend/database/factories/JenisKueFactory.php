<?php

namespace Database\Factories;

use App\Models\JenisKue;
use Illuminate\Database\Eloquent\Factories\Factory;

class JenisKueFactory extends Factory
{
    protected $model = JenisKue::class;

    public function definition()
    {
        return [
            'jenisKue' => $this->faker->word(), // sesuaikan field dengan tipe data kamu
        ];
    }
}
