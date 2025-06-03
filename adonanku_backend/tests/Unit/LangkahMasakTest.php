<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\LangkahMasakRepositoryInterface;
use Mockery;

class LangkahMasakTest extends TestCase
{
    protected $mockLangkahMasakRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockLangkahMasakRepository = Mockery::mock(LangkahMasakRepositoryInterface::class);
        $this->app->instance(LangkahMasakRepositoryInterface::class, $this->mockLangkahMasakRepository);
    }

    public function test_langkah_masak_can_be_created()
    {
        $langkahMasakData = [
            'idResep' => 1,
            'urutanMasak' => 1,
            'deskripsi' => 'Panaskan minyak goreng'
        ];

        $this->mockLangkahMasakRepository
            ->shouldReceive('create')
            ->once()
            ->with($langkahMasakData)
            ->andReturn((object) $langkahMasakData);

        $langkahMasak = $this->mockLangkahMasakRepository->create($langkahMasakData);

        $this->assertEquals(1, $langkahMasak->idResep);
        $this->assertEquals(1, $langkahMasak->urutanMasak);
        $this->assertEquals('Panaskan minyak goreng', $langkahMasak->deskripsi);
    }

    public function test_langkah_masak_can_be_read()
    {
        $langkahMasakId = 1;
        $langkahMasakData = (object) [
            'idLangkahMasak' => $langkahMasakId,
            'idResep' => 1,
            'urutanMasak' => 1,
            'deskripsi' => 'Panaskan minyak goreng'
        ];

        $this->mockLangkahMasakRepository
            ->shouldReceive('findById')
            ->once()
            ->with($langkahMasakId)
            ->andReturn($langkahMasakData);

        $langkahMasak = $this->mockLangkahMasakRepository->findById($langkahMasakId);

        $this->assertEquals($langkahMasakId, $langkahMasak->idLangkahMasak);
        $this->assertEquals(1, $langkahMasak->idResep);
        $this->assertEquals(1, $langkahMasak->urutanMasak);
        $this->assertEquals('Panaskan minyak goreng', $langkahMasak->deskripsi);
    }

    public function test_langkah_masak_can_be_updated()
    {
        $langkahMasakId = 1;
        $updateData = [
            'deskripsi' => 'Panaskan minyak goreng dengan api sedang'
        ];
        $updatedLangkahMasakData = (object) array_merge([
            'idLangkahMasak' => $langkahMasakId,
            'idResep' => 1,
            'urutanMasak' => 1
        ], $updateData);

        $this->mockLangkahMasakRepository
            ->shouldReceive('update')
            ->once()
            ->with($langkahMasakId, $updateData)
            ->andReturn($updatedLangkahMasakData);

        $langkahMasak = $this->mockLangkahMasakRepository->update($langkahMasakId, $updateData);

        $this->assertEquals('Panaskan minyak goreng dengan api sedang', $langkahMasak->deskripsi);
    }

    public function test_langkah_masak_can_be_deleted()
    {
        $langkahMasakId = 1;

        $this->mockLangkahMasakRepository
            ->shouldReceive('delete')
            ->once()
            ->with($langkahMasakId)
            ->andReturn(true);

        $result = $this->mockLangkahMasakRepository->delete($langkahMasakId);

        $this->assertTrue($result);
    }
}
