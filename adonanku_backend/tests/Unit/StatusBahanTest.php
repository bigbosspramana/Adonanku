<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\StatusBahanRepositoryInterface;
use Mockery;

class StatusBahanTest extends TestCase
{
    protected $mockStatusBahanRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockStatusBahanRepository = Mockery::mock(StatusBahanRepositoryInterface::class);
        $this->app->instance(StatusBahanRepositoryInterface::class, $this->mockStatusBahanRepository);
    }

    public function test_status_bahan_can_be_created()
    {
        $statusBahanData = [
            'status' => 'Test Status',
        ];

        $this->mockStatusBahanRepository
            ->shouldReceive('create')
            ->once()
            ->with($statusBahanData)
            ->andReturn((object) $statusBahanData);

        $statusBahan = $this->mockStatusBahanRepository->create($statusBahanData);

        $this->assertEquals('Test Status', $statusBahan->status);
    }

    public function test_status_bahan_can_be_read()
    {
        $statusBahanId = 1;
        $statusBahanData = (object) [
            'idStatusBahan' => $statusBahanId,
            'status' => 'Test Status',
        ];

        $this->mockStatusBahanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($statusBahanId)
            ->andReturn($statusBahanData);

        $statusBahan = $this->mockStatusBahanRepository->findById($statusBahanId);

        $this->assertEquals($statusBahanId, $statusBahan->idStatusBahan);
        $this->assertEquals('Test Status', $statusBahan->status);
    }

    public function test_status_bahan_can_be_updated()
    {
        $statusBahanId = 1;
        $updateData = [
            'status' => 'Updated Status',
        ];
        $updatedStatusBahanData = (object) array_merge([
            'idStatusBahan' => $statusBahanId
        ], $updateData);

        $this->mockStatusBahanRepository
            ->shouldReceive('update')
            ->once()
            ->with($statusBahanId, $updateData)
            ->andReturn($updatedStatusBahanData);

        $statusBahan = $this->mockStatusBahanRepository->update($statusBahanId, $updateData);

        $this->assertEquals('Updated Status', $statusBahan->status);
    }

    public function test_status_bahan_can_be_deleted()
    {
        $statusBahanId = 1;

        $this->mockStatusBahanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($statusBahanId)
            ->andReturn(true);

        $result = $this->mockStatusBahanRepository->delete($statusBahanId);

        $this->assertTrue($result);
    }
}