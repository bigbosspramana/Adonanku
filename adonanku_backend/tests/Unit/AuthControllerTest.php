<?php

// namespace Tests\Unit;

// use App\Http\Controllers\AuthController;
// use App\Models\User;
// use Illuminate\Foundation\Testing\RefreshDatabase;
// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\Hash;
// use Tests\TestCase;
// use Mockery;

// class AuthControllerTest extends TestCase
// {
//     use RefreshDatabase;

//     /** @test */
//     public function user_can_register_successfully()
//     {
//         $controller = new AuthController();

//         $request = new Request([
//             'nama' => 'Test User',
//             'username' => 'testuser',
//             'email' => 'test@example.com',
//             'password' => 'password123',
//             'password_confirmation' => 'password123',
//         ]);

//         $response = $controller->register($request);

//         $this->assertEquals(201, $response->status());
//         $this->assertEquals('User berhasil didaftarkan', $response->getData()->message);
//         $this->assertDatabaseHas('users', ['email' => 'test@example.com']);
//     }

//     /** @test */
//     public function registration_fails_with_missing_fields()
//     {
//         $controller = new AuthController();
//         $request = new Request([
//             'nama' => 'Test User',
//             'username' => 'testuser',
//             'email' => 'test@example.com',
//             'password' => 'password123',
//             'password_confirmation' => '',
//         ]);

//         $response = $controller->register($request);

//         $this->assertEquals(422, $response->status());
//         $data = $response->getData(true);
//     }

//     /** @test */
//     public function user_can_login_with_correct_credentials()
//     {
//         $user = User::factory()->create([
//             'email' => 'login@example.com',
//             'password' => Hash::make('password123'),
//         ]);

//         $controller = new AuthController();
//         $request = new Request([
//             'email' => $user->email,
//             'password' => 'password123',
//         ]);

//         $response = $controller->login($request);

//         $this->assertEquals(200, $response->status());
//         $this->assertEquals('Login berhasil', $response->getData()->message);
//         $this->assertArrayHasKey('access_token', $response->getData(true));
//     }

//     /** @test */
//     public function login_fails_with_wrong_credentials()
//     {
//         $user = User::factory()->create([
//             'email' => 'wrong@example.com',
//             'password' => Hash::make('password123'),
//         ]);

//         $controller = new AuthController();
//         $request = new Request([
//             'email' => $user->email,
//             'password' => 'password12',
//         ]);

//         $response = $controller->login($request);

//         $this->assertEquals(401, $response->status());
//         $this->assertEquals('Email atau password salah', $response->getData()->message);
//     }

//     /** @test */
//     public function user_can_logout_successfully()
//     {
//         $mockToken = Mockery::mock();
//         $mockToken->shouldReceive('delete')->once()->andReturnTrue();

//         $mockUser = Mockery::mock();
//         $mockUser->shouldReceive('currentAccessToken')->once()->andReturn($mockToken);

//         $mockRequest = Mockery::mock(Request::class);
//         $mockRequest->shouldReceive('user')->once()->andReturn($mockUser);

//         $controller = new AuthController();
//         $response = $controller->logout($mockRequest);

//         $this->assertEquals(200, $response->status());
//         $this->assertEquals('Logout berhasil', $response->getData()->message);
//     }
// }

namespace Tests\Unit;

use App\Http\Controllers\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Mockery;
use Tests\TestCase;

class AuthControllerTest extends TestCase
{
    protected function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }

    /** @test */
    public function user_can_register_without_database()
    {
        // Mock User model static call
        $userMock = Mockery::mock('alias:App\Models\User');
        $userMock->shouldReceive('create')->once()->andReturn((object)[
            'id' => 1,
            'email' => 'test@example.com',
            'nama' => 'Test User'
        ]);

        $request = new Request([
            'nama' => 'Test User',
            'username' => 'testuser',
            'email' => 'test@example.com',
            'password' => 'password123',
            'password_confirmation' => 'password123',
        ]);

        $controller = new AuthController();
        $response = $controller->register($request);

        $this->assertEquals(201, $response->status());
        $this->assertEquals('User berhasil didaftarkan', $response->getData()->message);
    }

    /** @test */
    public function registration_fails_with_missing_fields()
    {
        $request = new Request([
            'nama' => 'Test User',
            'username' => 'testuser',
            'email' => 'test@example.com',
            'password' => 'password123',
            'password_confirmation' => '', // mismatch
        ]);

        $controller = new AuthController();
        $response = $controller->register($request);

        $this->assertEquals(422, $response->status());
        $this->assertArrayHasKey('errors', $response->getData(true));
    }

    /** @test */
    public function user_can_login_without_database()
    {
        $fakeUser = Mockery::mock();
        $fakeUser->password = 'hashed_password';

        // Token mock
        $fakeUser->shouldReceive('createToken')
            ->once()
            ->andReturn((object)['plainTextToken' => 'fake-token']);

        // Mock User::where(...)->first()
        $userModel = Mockery::mock('alias:App\Models\User');
        $userModel->shouldReceive('where')
            ->with('email', 'login@example.com')
            ->andReturnSelf();
        $userModel->shouldReceive('first')
            ->andReturn($fakeUser);

        // Mock Hash::check
        Hash::shouldReceive('check')
            ->with('password123', 'hashed_password')
            ->once()
            ->andReturnTrue();

        $request = new Request([
            'email' => 'login@example.com',
            'password' => 'password123',
        ]);

        $controller = new AuthController();
        $response = $controller->login($request);

        $this->assertEquals(200, $response->status());
        $this->assertEquals('Login berhasil', $response->getData()->message);
        $this->assertArrayHasKey('access_token', $response->getData(true));
    }

    /** @test */
    public function login_fails_with_wrong_credentials()
    {
        $fakeUser = Mockery::mock();
        $fakeUser->password = 'hashed_password';

        $userModel = Mockery::mock('alias:App\Models\User');
        $userModel->shouldReceive('where')
            ->with('email', 'wrong@example.com')
            ->andReturnSelf();
        $userModel->shouldReceive('first')
            ->andReturn($fakeUser);

        Hash::shouldReceive('check')
            ->with('wrongpassword', 'hashed_password')
            ->once()
            ->andReturnFalse();

        $request = new Request([
            'email' => 'wrong@example.com',
            'password' => 'wrongpassword',
        ]);

        $controller = new AuthController();
        $response = $controller->login($request);

        $this->assertEquals(401, $response->status());
        $this->assertEquals('Email atau password salah', $response->getData()->message);
    }

    /** @test */
    public function user_can_logout_without_database()
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
}

