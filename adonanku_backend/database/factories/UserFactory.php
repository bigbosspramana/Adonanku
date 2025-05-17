<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition(): array
    {
        return [
            'nama' => $this->faker->name, // Nama pengguna
            'email' => $this->faker->unique()->safeEmail, // Email pengguna
            'username' => $this->faker->unique()->userName, // Username pengguna
            'password' => bcrypt('password'), // Password pengguna (gunakan bcrypt untuk enkripsi)
        ];
    }
}
