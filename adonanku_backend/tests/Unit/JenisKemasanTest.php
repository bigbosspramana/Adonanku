<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\JenisKemasanRepositoryInterface;
use Mockery;

class JenisKemasanTest extends TestCase
{
    protected $mockJenisKemasanRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockJenisKemasanRepository = Mockery::mock(JenisKemasanRepositoryInterface::class);
        $this->app->instance(JenisKemasanRepositoryInterface::class, $this->mockJenisKemasanRepository);
    }

    public function test_jenis_kemasan_can_be_created()
    {
        $jenisKemasanData = [
            'jenisKemasan' => 'bungkus'
        ];

        $this->mockJenisKemasanRepository
            ->shouldReceive('create')
            ->once()
            ->with($jenisKemasanData)
            ->andReturn((object) $jenisKemasanData);

        $jenisKemasan = $this->mockJenisKemasanRepository->create($jenisKemasanData);

        $this->assertEquals('bungkus', $jenisKemasan->jenisKemasan);
    }

    public function test_jenis_kemasan_can_be_read()
    {
        $jenisKemasanId = 1;
        $jenisKemasanData = (object) [
            'idJenisKemasan' => $jenisKemasanId,
            'jenisKemasan' => 'bungkus'
        ];

        $this->mockJenisKemasanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($jenisKemasanId)
            ->andReturn($jenisKemasanData);

        $jenisKemasan = $this->mockJenisKemasanRepository->findById($jenisKemasanId);

        $this->assertEquals($jenisKemasanId, $jenisKemasan->idJenisKemasan);
        $this->assertEquals('bungkus', $jenisKemasan->jenisKemasan);
    }

    public function test_jenis_kemasan_can_be_updated()
    {
        $jenisKemasanId = 1;
        $updateData = [
            'jenisKemasan' => 'Updated Kemasan'
        ];
        $updatedJenisKemasanData = (object) array_merge([
            'idJenisKemasan' => $jenisKemasanId
        ], $updateData);

        $this->mockJenisKemasanRepository
            ->shouldReceive('update')
            ->once()
            ->with($jenisKemasanId, $updateData)
            ->andReturn($updatedJenisKemasanData);

        $jenisKemasan = $this->mockJenisKemasanRepository->update($jenisKemasanId, $updateData);

        $this->assertEquals('Updated Kemasan', $jenisKemasan->jenisKemasan);
    }

    public function test_jenis_kemasan_can_be_deleted()
    {
        $jenisKemasanId = 1;

        $this->mockJenisKemasanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($jenisKemasanId)
            ->andReturn(true);

        $result = $this->mockJenisKemasanRepository->delete($jenisKemasanId);

        $this->assertTrue($result);
    }

    public function test_jenis_kemasan_can_be_listed()
    {
        $jenisKemasanList = [
            (object) ['idJenisKemasan' => 1, 'jenisKemasan' => 'kaleng'],
            (object) ['idJenisKemasan' => 2, 'jenisKemasan' => 'bungkus']
        ];

        $this->mockJenisKemasanRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($jenisKemasanList);

        $result = $this->mockJenisKemasanRepository->all();

        $this->assertCount(2, $result);
        $this->assertEquals('kaleng', $result[0]->jenisKemasan);
        $this->assertEquals('bungkus', $result[1]->jenisKemasan);
    }
}
