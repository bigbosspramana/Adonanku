<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;
use Tests\TestCase;

class AuthControllerTest extends TestCase
{
    public function test_register_success()
    {
        $response = $this->postJson('api/register', [
            'nama' => 'Norlan Der',
            'username' => 'norlna',
            'email' => 'derick112345@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $response->assertStatus(201)
                 ->assertJson([
                     'message' => 'User berhasil didaftarkan',
                 ]);

        $this->assertDatabaseHas('users', [
            'email' => 'derick112345@example.com',
            'username' => 'norlna',
        ]);
    }

    public function test_register_validation_error()
    {
        $response = $this->postJson('api/register', [
            // Missing required fields
        ]);

        $response->assertStatus(422)
                 ->assertJsonStructure([
                     'errors' => ['nama', 'username', 'email', 'password']
                 ]);
    }

    public function test_register_duplicate_email()
    {
        User::factory()->create([
            'email' => 'duplicate@example.com',
        ]);

        $response = $this->postJson('api/register', [
            'nama' => 'Jane Doe',
            'username' => 'janedoe',
            'email' => 'duplicate@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $response->assertStatus(422)
                 ->assertJsonStructure(['errors' => ['email']]);
    }
}
