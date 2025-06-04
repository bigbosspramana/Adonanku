<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\ResepRepositoryInterface;
use Mockery;

class ResepTest extends TestCase
{
    protected $mockResepRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockResepRepository = Mockery::mock(ResepRepositoryInterface::class);
        $this->app->instance(ResepRepositoryInterface::class, $this->mockResepRepository);
    }

    public function test_resep_can_be_created()
    {
        $resepData = [
            'idUser' => 1,
            'namaResep' => 'Kue Lapis',
            'idJenisKue' => 1,
            'idCaraMasak' => 1,
            'isPublic' => true,
            'durasiMasak' => 60
        ];

        $this->mockResepRepository
            ->shouldReceive('create')
            ->once()
            ->with($resepData)
            ->andReturn((object) $resepData);

        $resep = $this->mockResepRepository->create($resepData);

        $this->assertEquals('Kue Lapis', $resep->namaResep);
        $this->assertEquals(60, $resep->durasiMasak);
    }

    public function test_resep_can_be_read()
    {
        $resepId = 1;
        $resepData = (object) [
            'idResep' => $resepId,
            'idUser' => 1,
            'namaResep' => 'Kue Lapis',
            'idJenisKue' => 1,
            'idCaraMasak' => 1,
            'isPublic' => true,
            'durasiMasak' => 60
        ];

        $this->mockResepRepository
            ->shouldReceive('findById')
            ->once()
            ->with($resepId)
            ->andReturn($resepData);

        $resep = $this->mockResepRepository->findById($resepId);

        $this->assertEquals($resepId, $resep->idResep);
        $this->assertEquals('Kue Lapis', $resep->namaResep);
    }

    public function test_resep_can_be_updated()
    {
        $resepId = 1;
        $updateData = [
            'namaResep' => 'Kue Lapis Legit',
            'durasiMasak' => 90
        ];
        $updatedResepData = (object) array_merge([
            'idResep' => $resepId,
            'idUser' => 1,
            'idJenisKue' => 1,
            'idCaraMasak' => 1,
            'isPublic' => true
        ], $updateData);

        $this->mockResepRepository
            ->shouldReceive('update')
            ->once()
            ->with($resepId, $updateData)
            ->andReturn($updatedResepData);

        $resep = $this->mockResepRepository->update($resepId, $updateData);

        $this->assertEquals('Kue Lapis Legit', $resep->namaResep);
        $this->assertEquals(90, $resep->durasiMasak);
    }

    public function test_resep_can_be_deleted()
    {
        $resepId = 1;

        $this->mockResepRepository
            ->shouldReceive('delete')
            ->once()
            ->with($resepId)
            ->andReturn(true);

        $result = $this->mockResepRepository->delete($resepId);

        $this->assertTrue($result);
    }
}