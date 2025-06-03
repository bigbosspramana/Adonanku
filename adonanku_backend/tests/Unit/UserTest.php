<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\UserRepositoryInterface;
use Mockery;

class UserTest extends TestCase
{
    protected $mockUserRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockUserRepository = Mockery::mock(UserRepositoryInterface::class);
        $this->app->instance(UserRepositoryInterface::class, $this->mockUserRepository);
    }

    public function test_user_can_be_created()
    {
        $userData = [
            'nama' => 'Test User',
            'email' => 'test@example.com',
            'username' => 'testuser',
            'password' => 'password123',
        ];

        $this->mockUserRepository
            ->shouldReceive('create')
            ->once()
            ->with($userData)
            ->andReturn((object) $userData);

        $user = $this->mockUserRepository->create($userData);

        $this->assertEquals('Test User', $user->nama);
        $this->assertEquals('test@example.com', $user->email);
        $this->assertEquals('testuser', $user->username);
    }

    public function test_user_can_be_read()
    {
        $userId = 1;
        $userData = (object) [
            'id' => $userId,
            'nama' => 'Test User',
            'email' => 'test@example.com',
            'username' => 'testuser',
            'password' => 'password123',
        ];

        $this->mockUserRepository
            ->shouldReceive('findById')
            ->once()
            ->with($userId)
            ->andReturn($userData);

        $user = $this->mockUserRepository->findById($userId);

        $this->assertEquals($userId, $user->id);
        $this->assertEquals('Test User', $user->nama);
        $this->assertEquals('testuser', $user->username);
    }

    public function test_user_can_be_updated()
    {
        $userId = 1;
        $updateData = [
            'nama' => 'Updated Test User',
            'username' => 'updateduser',
        ];
        $updatedUserData = (object) array_merge([
            'id' => $userId,
            'email' => 'test@example.com',
            'password' => 'password123'
        ], $updateData);

        $this->mockUserRepository
            ->shouldReceive('update')
            ->once()
            ->with($userId, $updateData)
            ->andReturn($updatedUserData);

        $user = $this->mockUserRepository->update($userId, $updateData);

        $this->assertEquals('Updated Test User', $user->nama);
        $this->assertEquals('updateduser', $user->username);
    }

    public function test_user_can_be_deleted()
    {
        $userId = 1;

        $this->mockUserRepository
            ->shouldReceive('delete')
            ->once()
            ->with($userId)
            ->andReturn(true);

        $result = $this->mockUserRepository->delete($userId);

        $this->assertTrue($result);
    }
}


