<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\SatuanBahanRepositoryInterface;
use Mockery;

class SatuanBahanTest extends TestCase
{
    protected $mockSatuanBahanRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockSatuanBahanRepository = Mockery::mock(SatuanBahanRepositoryInterface::class);
        $this->app->instance(SatuanBahanRepositoryInterface::class, $this->mockSatuanBahanRepository);
    }

    public function test_satuan_bahan_can_be_created()
    {
        $satuanBahanData = [
            'satuan' => 'Kilogram'
        ];

        $this->mockSatuanBahanRepository
            ->shouldReceive('create')
            ->once()
            ->with($satuanBahanData)
            ->andReturn((object) $satuanBahanData);

        $satuanBahan = $this->mockSatuanBahanRepository->create($satuanBahanData);

        $this->assertEquals('Kilogram', $satuanBahan->satuan);
    }

    public function test_satuan_bahan_can_be_read()
    {
        $satuanBahanId = 1;
        $satuanBahanData = (object) [
            'idSatuanBahan' => $satuanBahanId,
            'satuan' => 'Kilogram'
        ];

        $this->mockSatuanBahanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($satuanBahanId)
            ->andReturn($satuanBahanData);

        $satuanBahan = $this->mockSatuanBahanRepository->findById($satuanBahanId);

        $this->assertEquals($satuanBahanId, $satuanBahan->idSatuanBahan);
        $this->assertEquals('Kilogram', $satuanBahan->satuan);
    }

    public function test_satuan_bahan_can_be_updated()
    {
        $satuanBahanId = 1;
        $updateData = [
            'satuan' => 'Gram'
        ];
        $updatedSatuanBahanData = (object) array_merge([
            'idSatuanBahan' => $satuanBahanId
        ], $updateData);

        $this->mockSatuanBahanRepository
            ->shouldReceive('update')
            ->once()
            ->with($satuanBahanId, $updateData)
            ->andReturn($updatedSatuanBahanData);

        $satuanBahan = $this->mockSatuanBahanRepository->update($satuanBahanId, $updateData);

        $this->assertEquals('Gram', $satuanBahan->satuan);
    }

    public function test_satuan_bahan_can_be_deleted()
    {
        $satuanBahanId = 1;

        $this->mockSatuanBahanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($satuanBahanId)
            ->andReturn(true);

        $result = $this->mockSatuanBahanRepository->delete($satuanBahanId);

        $this->assertTrue($result);
    }
}