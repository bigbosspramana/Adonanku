<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\KonversiResepRepositoryInterface;
use Mockery;

class KonversiResepTest extends TestCase
{
    protected $mockKonversiResepRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockKonversiResepRepository = Mockery::mock(KonversiResepRepositoryInterface::class);
        $this->app->instance(KonversiResepRepositoryInterface::class, $this->mockKonversiResepRepository);
    }

    public function test_konversi_resep_can_be_created()
    {
        $konversiResepData = [
            'idKonversi' => 1,
            'idResep' => 1
        ];

        $this->mockKonversiResepRepository
            ->shouldReceive('create')
            ->once()
            ->with($konversiResepData)
            ->andReturn((object) $konversiResepData);

        $konversiResep = $this->mockKonversiResepRepository->create($konversiResepData);

        $this->assertEquals(1, $konversiResep->idKonversi);
        $this->assertEquals(1, $konversiResep->idResep);
    }

    public function test_konversi_resep_can_be_read()
    {
        $konversiResepId = 1;
        $konversiResepData = (object) [
            'idKonversiResep' => $konversiResepId,
            'idKonversi' => 1,
            'idResep' => 1
        ];

        $this->mockKonversiResepRepository
            ->shouldReceive('findById')
            ->once()
            ->with($konversiResepId)
            ->andReturn($konversiResepData);

        $konversiResep = $this->mockKonversiResepRepository->findById($konversiResepId);

        $this->assertEquals($konversiResepId, $konversiResep->idKonversiResep);
        $this->assertEquals(1, $konversiResep->idKonversi);
        $this->assertEquals(1, $konversiResep->idResep);
    }

    public function test_konversi_resep_can_be_updated()
    {
        $konversiResepId = 1;
        $updateData = [
            'idResep' => 2
        ];
        $updatedKonversiResepData = (object) array_merge([
            'idKonversiResep' => $konversiResepId,
            'idKonversi' => 1
        ], $updateData);

        $this->mockKonversiResepRepository
            ->shouldReceive('update')
            ->once()
            ->with($konversiResepId, $updateData)
            ->andReturn($updatedKonversiResepData);

        $konversiResep = $this->mockKonversiResepRepository->update($konversiResepId, $updateData);

        $this->assertEquals(2, $konversiResep->idResep);
    }

    public function test_konversi_resep_can_be_deleted()
    {
        $konversiResepId = 1;

        $this->mockKonversiResepRepository
            ->shouldReceive('delete')
            ->once()
            ->with($konversiResepId)
            ->andReturn(true);

        $result = $this->mockKonversiResepRepository->delete($konversiResepId);

        $this->assertTrue($result);
    }
}
