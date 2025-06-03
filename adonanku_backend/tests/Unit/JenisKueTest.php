<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\JenisKueRepositoryInterface;
use Mockery;

class JenisKueTest extends TestCase
{
    protected $mockJenisKueRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockJenisKueRepository = Mockery::mock(JenisKueRepositoryInterface::class);
        $this->app->instance(JenisKueRepositoryInterface::class, $this->mockJenisKueRepository);
    }

    public function test_jenis_kue_can_be_created()
    {
        $jenisKueData = [
            'jenisKue' => 'basah'
        ];

        $this->mockJenisKueRepository
            ->shouldReceive('create')
            ->once()
            ->with($jenisKueData)
            ->andReturn((object) $jenisKueData);

        $jenisKue = $this->mockJenisKueRepository->create($jenisKueData);

        $this->assertEquals('basah', $jenisKue->jenisKue);
    }

    public function test_jenis_kue_can_be_read()
    {
        $jenisKueId = 1;
        $jenisKueData = (object) [
            'idJenisKue' => $jenisKueId,
            'jenisKue' => 'basah'
        ];

        $this->mockJenisKueRepository
            ->shouldReceive('findById')
            ->once()
            ->with($jenisKueId)
            ->andReturn($jenisKueData);

        $jenisKue = $this->mockJenisKueRepository->findById($jenisKueId);

        $this->assertEquals($jenisKueId, $jenisKue->idJenisKue);
        $this->assertEquals('basah', $jenisKue->jenisKue);
    }

    public function test_jenis_kue_can_be_updated()
    {
        $jenisKueId = 1;
        $updateData = [
            'jenisKue' => 'Updated Kue'
        ];
        $updatedJenisKueData = (object) array_merge([
            'idJenisKue' => $jenisKueId
        ], $updateData);

        $this->mockJenisKueRepository
            ->shouldReceive('update')
            ->once()
            ->with($jenisKueId, $updateData)
            ->andReturn($updatedJenisKueData);

        $jenisKue = $this->mockJenisKueRepository->update($jenisKueId, $updateData);

        $this->assertEquals('Updated Kue', $jenisKue->jenisKue);
    }

    public function test_jenis_kue_can_be_deleted()
    {
        $jenisKueId = 1;

        $this->mockJenisKueRepository
            ->shouldReceive('delete')
            ->once()
            ->with($jenisKueId)
            ->andReturn(true);

        $result = $this->mockJenisKueRepository->delete($jenisKueId);

        $this->assertTrue($result);
    }

    public function test_jenis_kue_can_be_listed()
    {
        $jenisKueList = [
            (object) ['idJenisKue' => 1, 'jenisKue' => 'basah'],
            (object) ['idJenisKue' => 2, 'jenisKue' => 'kering']
        ];

        $this->mockJenisKueRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($jenisKueList);

        $result = $this->mockJenisKueRepository->all();

        $this->assertCount(2, $result);
        $this->assertEquals('basah', $result[0]->jenisKue);
        $this->assertEquals('kering', $result[1]->jenisKue);
    }
}
