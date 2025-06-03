<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\ResepBahanRepositoryInterface;
use Mockery;

class ResepBahanTest extends TestCase
{
    protected $mockResepBahanRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockResepBahanRepository = Mockery::mock(ResepBahanRepositoryInterface::class);
        $this->app->instance(ResepBahanRepositoryInterface::class, $this->mockResepBahanRepository);
    }

    public function test_resep_bahan_can_be_created()
    {
        $resepBahanData = [
            'idResep' => 1,
            'idBahan' => 1,
            'jumlahBahan' => 200
        ];

        $this->mockResepBahanRepository
            ->shouldReceive('create')
            ->once()
            ->with($resepBahanData)
            ->andReturn((object) $resepBahanData);

        $resepBahan = $this->mockResepBahanRepository->create($resepBahanData);

        $this->assertEquals(1, $resepBahan->idResep);
        $this->assertEquals(1, $resepBahan->idBahan);
        $this->assertEquals(200, $resepBahan->jumlahBahan);
    }

    public function test_resep_bahan_can_be_read()
    {
        $resepBahanId = 1;
        $resepBahanData = (object) [
            'idResepBahan' => $resepBahanId,
            'idResep' => 1,
            'idBahan' => 1,
            'jumlahBahan' => 200
        ];

        $this->mockResepBahanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($resepBahanId)
            ->andReturn($resepBahanData);

        $resepBahan = $this->mockResepBahanRepository->findById($resepBahanId);

        $this->assertEquals($resepBahanId, $resepBahan->idResepBahan);
        $this->assertEquals(1, $resepBahan->idResep);
        $this->assertEquals(1, $resepBahan->idBahan);
        $this->assertEquals(200, $resepBahan->jumlahBahan);
    }

    public function test_resep_bahan_can_be_updated()
    {
        $resepBahanId = 1;
        $updateData = [
            'jumlahBahan' => 300
        ];
        $updatedResepBahanData = (object) array_merge([
            'idResepBahan' => $resepBahanId,
            'idResep' => 1,
            'idBahan' => 1
        ], $updateData);

        $this->mockResepBahanRepository
            ->shouldReceive('update')
            ->once()
            ->with($resepBahanId, $updateData)
            ->andReturn($updatedResepBahanData);

        $resepBahan = $this->mockResepBahanRepository->update($resepBahanId, $updateData);

        $this->assertEquals(300, $resepBahan->jumlahBahan);
    }

    public function test_resep_bahan_can_be_deleted()
    {
        $resepBahanId = 1;

        $this->mockResepBahanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($resepBahanId)
            ->andReturn(true);

        $result = $this->mockResepBahanRepository->delete($resepBahanId);

        $this->assertTrue($result);
    }
}
