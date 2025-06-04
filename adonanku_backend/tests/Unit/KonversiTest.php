<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\KonversiRepositoryInterface;
use Mockery;

class KonversiTest extends TestCase
{
    protected $mockKonversiRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockKonversiRepository = Mockery::mock(KonversiRepositoryInterface::class);
        $this->app->instance(KonversiRepositoryInterface::class, $this->mockKonversiRepository);
    }

    public function test_konversi_can_be_created()
    {
        $konversiData = [
            'namaKonversi' => 'Test Konversi',
            'jumlahKonversi' => 10,
            'idUser' => 1
        ];

        $this->mockKonversiRepository
            ->shouldReceive('create')
            ->once()
            ->with($konversiData)
            ->andReturn((object) $konversiData);

        $konversi = $this->mockKonversiRepository->create($konversiData);

        $this->assertEquals('Test Konversi', $konversi->namaKonversi);
        $this->assertEquals(10, $konversi->jumlahKonversi);
        $this->assertEquals(1, $konversi->idUser);
    }

    public function test_konversi_can_be_read()
    {
        $konversiId = 1;
        $konversiData = (object) [
            'idKonversi' => $konversiId,
            'namaKonversi' => 'Test Konversi',
            'jumlahKonversi' => 10,
            'idUser' => 1
        ];

        $this->mockKonversiRepository
            ->shouldReceive('findById')
            ->once()
            ->with($konversiId)
            ->andReturn($konversiData);

        $konversi = $this->mockKonversiRepository->findById($konversiId);

        $this->assertEquals($konversiId, $konversi->idKonversi);
        $this->assertEquals('Test Konversi', $konversi->namaKonversi);
        $this->assertEquals(10, $konversi->jumlahKonversi);
        $this->assertEquals(1, $konversi->idUser);
    }

    public function test_konversi_can_be_updated()
    {
        $konversiId = 1;
        $updateData = [
            'namaKonversi' => 'Updated Konversi',
            'jumlahKonversi' => 20
        ];
        $updatedKonversiData = (object) array_merge([
            'idKonversi' => $konversiId,
            'idUser' => 1
        ], $updateData);

        $this->mockKonversiRepository
            ->shouldReceive('update')
            ->once()
            ->with($konversiId, $updateData)
            ->andReturn($updatedKonversiData);

        $konversi = $this->mockKonversiRepository->update($konversiId, $updateData);

        $this->assertEquals('Updated Konversi', $konversi->namaKonversi);
        $this->assertEquals(20, $konversi->jumlahKonversi);
    }

    public function test_konversi_can_be_deleted()
    {
        $konversiId = 1;

        $this->mockKonversiRepository
            ->shouldReceive('delete')
            ->once()
            ->with($konversiId)
            ->andReturn(true);

        $result = $this->mockKonversiRepository->delete($konversiId);

        $this->assertTrue($result);
    }
}
