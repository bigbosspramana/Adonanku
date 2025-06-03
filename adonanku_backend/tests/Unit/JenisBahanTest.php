<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\JenisBahanRepositoryInterface;
use Mockery;

class JenisBahanTest extends TestCase
{
    protected $mockJenisBahanRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockJenisBahanRepository = Mockery::mock(JenisBahanRepositoryInterface::class);
        $this->app->instance(JenisBahanRepositoryInterface::class, $this->mockJenisBahanRepository);
    }

    public function test_jenis_bahan_can_be_created()
    {
        $jenisBahanData = [
            'jenisBahan' => 'Kering'
        ];

        $this->mockJenisBahanRepository
            ->shouldReceive('create')
            ->once()
            ->with($jenisBahanData)
            ->andReturn((object) $jenisBahanData);

        $jenisBahan = $this->mockJenisBahanRepository->create($jenisBahanData);

        $this->assertEquals('Kering', $jenisBahan->jenisBahan);
    }

    public function test_jenis_bahan_can_be_read()
    {
        $jenisBahanId = 1;
        $jenisBahanData = (object) [
            'idJenisBahan' => $jenisBahanId,
            'jenisBahan' => 'Kering'
        ];

        $this->mockJenisBahanRepository
            ->shouldReceive('findById')
            ->once()
            ->with($jenisBahanId)
            ->andReturn($jenisBahanData);

        $jenisBahan = $this->mockJenisBahanRepository->findById($jenisBahanId);

        $this->assertEquals($jenisBahanId, $jenisBahan->idJenisBahan);
        $this->assertEquals('Kering', $jenisBahan->jenisBahan);
    }

    public function test_jenis_bahan_can_be_updated()
    {
        $jenisBahanId = 1;
        $updateData = [
            'jenisBahan' => 'Updated Bahan'
        ];
        $updatedJenisBahanData = (object) array_merge([
            'idJenisBahan' => $jenisBahanId
        ], $updateData);

        $this->mockJenisBahanRepository
            ->shouldReceive('update')
            ->once()
            ->with($jenisBahanId, $updateData)
            ->andReturn($updatedJenisBahanData);

        $jenisBahan = $this->mockJenisBahanRepository->update($jenisBahanId, $updateData);

        $this->assertEquals('Updated Bahan', $jenisBahan->jenisBahan);
    }

    public function test_jenis_bahan_can_be_deleted()
    {
        $jenisBahanId = 1;

        $this->mockJenisBahanRepository
            ->shouldReceive('delete')
            ->once()
            ->with($jenisBahanId)
            ->andReturn(true);

        $result = $this->mockJenisBahanRepository->delete($jenisBahanId);

        $this->assertTrue($result);
    }

    public function test_jenis_bahan_can_be_listed()
    {
        $jenisBahanList = [
            (object) ['idJenisBahan' => 1, 'jenisBahan' => 'Kering'],
            (object) ['idJenisBahan' => 2, 'jenisBahan' => 'Basah']
        ];

        $this->mockJenisBahanRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($jenisBahanList);

        $result = $this->mockJenisBahanRepository->all();

        $this->assertCount(2, $result);
        $this->assertEquals('Kering', $result[0]->jenisBahan);
        $this->assertEquals('Basah', $result[1]->jenisBahan);
    }
}
