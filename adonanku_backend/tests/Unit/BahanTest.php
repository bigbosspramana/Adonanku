<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Bahan;
use App\Models\Repositories\BahanRepositoryInterface;
use Mockery;

class BahanTest extends TestCase
{
    protected $bahanRepository;

    public function setUp(): void
    {
        parent::setUp();
        $this->bahanRepository = Mockery::mock(BahanRepositoryInterface::class);
        $this->app->instance(BahanRepositoryInterface::class, $this->bahanRepository);
    }

    public function test_can_create_bahan()
    {
        $data = [
            'namaBahan' => 'Gula',
            'idSatuanBahan' => 1,
            'idInventory' => 1
        ];

        $bahan = new Bahan($data);

        $this->bahanRepository
            ->shouldReceive('create')
            ->with($data)
            ->once()
            ->andReturn($bahan);

        $result = $this->bahanRepository->create($data);

        $this->assertInstanceOf(Bahan::class, $result);
        $this->assertEquals($data['namaBahan'], $result->namaBahan);
    }

    public function test_can_find_bahan_by_id()
    {
        $bahan = new Bahan([
            'idBahan' => '1',
            'namaBahan' => 'Gula',
            'idSatuanBahan' => 1,
            'idInventory' => 1
        ]);

        $this->bahanRepository
            ->shouldReceive('findById')
            ->with('1')
            ->once()
            ->andReturn($bahan);

        $result = $this->bahanRepository->findById('1');

        $this->assertInstanceOf(Bahan::class, $result);
        $this->assertEquals('1', $result->idBahan);
    }

    public function test_can_update_bahan()
    {
        $data = [
            'namaBahan' => 'Garam',
            'idSatuanBahan' => 2,
            'idInventory' => 2
        ];

        $updatedBahan = new Bahan([
            'idBahan' => '1',
            'namaBahan' => 'Garam',
            'idSatuanBahan' => 2,
            'idInventory' => 2
        ]);

        $this->bahanRepository
            ->shouldReceive('update')
            ->with('1', $data)
            ->once()
            ->andReturn($updatedBahan);

        $result = $this->bahanRepository->update('1', $data);

        $this->assertInstanceOf(Bahan::class, $result);
        $this->assertEquals($data['namaBahan'], $result->namaBahan);
    }

    public function test_can_delete_bahan()
    {
        $this->bahanRepository
            ->shouldReceive('delete')
            ->with('1')
            ->once()
            ->andReturn(true);

        $result = $this->bahanRepository->delete('1');

        $this->assertTrue($result);
    }

    public function test_can_get_all_bahan()
    {
        $bahanList = collect([
            new Bahan([
                'idBahan' => '1',
                'namaBahan' => 'Gula',
                'idSatuanBahan' => 1,
                'idInventory' => 1
            ]),
            new Bahan([
                'idBahan' => '2',
                'namaBahan' => 'Garam',
                'idSatuanBahan' => 2,
                'idInventory' => 2
            ])
        ]);

        $this->bahanRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($bahanList);

        $result = $this->bahanRepository->all();

        $this->assertCount(2, $result);
    }

    public function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }
}
