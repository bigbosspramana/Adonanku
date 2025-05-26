<?php

namespace Database\Factories;

use App\Models\CaraMasak;
use Illuminate\Database\Eloquent\Factories\Factory;

class CaraMasakFactory extends Factory
{
    protected $model = CaraMasak::class;

    public function definition()
    {
        return [
            'caraMasak' => $this->faker->word(), // isi dengan kata random
        ];
    }
}
