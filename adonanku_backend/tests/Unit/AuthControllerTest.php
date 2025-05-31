<?php

namespace Tests\Unit;

use App\Http\Controllers\AuthController;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Tests\TestCase;
use Mockery;

class AuthControllerTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function user_can_register_successfully()
    {
        $controller = new AuthController();

        $request = new Request([
            'nama' => 'John Doe',
            'username' => 'johndoe',
            'email' => 'john@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $response = $controller->register($request);

        $this->assertEquals(201, $response->status());
        $this->assertEquals('User berhasil didaftarkan', $response->getData()->message);
        $this->assertDatabaseHas('users', ['email' => 'john@example.com']);
    }

    /** @test */
    public function register_requires_all_fields()
    {
        $controller = new AuthController();

        $request = new Request([
            'nama' => '',
            'username' => 'johndoe',
            'email' => 'john@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]); // Kosong

        $response = $controller->register($request);

        $this->assertEquals(422, $response->status());

        $data = $response->getData(true);
        $this->assertArrayHasKey('errors', $data);
        $this->assertArrayHasKey('nama', $data['errors']);
        $this->assertArrayHasKey('username', $data['errors']);
        $this->assertArrayHasKey('email', $data['errors']);
        $this->assertArrayHasKey('password', $data['errors']);
    }

    /** @test */
    public function user_can_login_successfully()
    {
        // Buat user nyata dengan password terenkripsi
        $user = User::factory()->create([
            'email' => 'test@example.com',
            'password' => Hash::make('password123'),
        ]);

        $controller = new AuthController();

        // Request login dengan data valid
        $request = new Request([
            'email' => 'test@example.com',
            'password' => 'password123',
        ]);

        $response = $controller->login($request);

        $this->assertEquals(200, $response->status());
        $this->assertEquals('Login berhasil', $response->getData()->message);
    }

    /** @test */
    public function user_can_logout_successfully()
    {
        $mockToken = Mockery::mock();
        $mockToken->shouldReceive('delete')->once()->andReturnTrue();

        $mockUser = Mockery::mock();
        $mockUser->shouldReceive('currentAccessToken')->once()->andReturn($mockToken);

        $mockRequest = Mockery::mock(Request::class);
        $mockRequest->shouldReceive('user')->once()->andReturn($mockUser);

        $controller = new AuthController();
        $response = $controller->logout($mockRequest);

        $this->assertEquals(200, $response->status());
        $this->assertEquals('Logout berhasil', $response->getData()->message);
    }

    /** @test */
    public function profile_returns_user_data()
    {
        $user = User::factory()->create();

        $mockRequest = Mockery::mock(Request::class);
        $mockRequest->shouldReceive('user')->once()->andReturn($user);

        $controller = new AuthController();
        $response = $controller->profile($mockRequest);

        $this->assertEquals(200, $response->status());
        $this->assertEquals('Profil user ditemukan', $response->getData()->message);
        $this->assertEquals($user->id, $response->getData()->user->id);
    }
}
