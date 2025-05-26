<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\User;
use App\Models\Resep;
use App\Models\Inventory;
use App\Models\Konversi;
use Illuminate\Foundation\Testing\RefreshDatabase;

class UserTest extends TestCase
{
    public function test_user_can_be_created()
    {
        $user = User::factory()->create([
            'nama' => 'Adonan Sempurna',
            'email' => 'adonan@example.com',
            'username' => 'adonanku',
            'password' => bcrypt('password123'),
        ]);

        $this->assertInstanceOf(User::class, $user);
        $this->assertNotNull($user->id);
        $this->assertEquals('Adonan Sempurna', $user->nama);
        $this->assertEquals('adonan@example.com', $user->email);
    }

    public function test_user_has_resep_relationship()
    {
        $user = User::factory()
            ->has(Resep::factory())
            ->create();

        // relasi hasMany mengembalikan Collection
        $this->assertInstanceOf(\Illuminate\Database\Eloquent\Collection::class, $user->resep);
        // Pastikan koleksi tidak kosong dan elemen pertamanya instance Resep
        $this->assertInstanceOf(Resep::class, $user->resep->first());
        // Cek foreign key idUser pada resep pertama sama dengan id user
        $this->assertEquals($user->id, $user->resep->first()->idUser);
    }


    public function test_user_has_inventory_relationship()
    {
        $user = User::factory()
            ->has(Inventory::factory())
            ->create();

        $this->assertInstanceOf(\Illuminate\Database\Eloquent\Collection::class, $user->inventory);
        $this->assertInstanceOf(Inventory::class, $user->inventory->first());
        $this->assertEquals($user->id, $user->inventory->first()->idUser);
    }

    public function test_user_has_konversi_relationship()
    {
        $user = User::factory()
            ->has(Konversi::factory()->count(1), 'konversi')
            ->create();

        $this->assertCount(1, $user->konversi);
        $this->assertInstanceOf(Konversi::class, $user->konversi->first());
        $this->assertEquals($user->id, $user->konversi->first()->idUser);
    }
}
