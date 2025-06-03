<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\Repositories\InventoryRepositoryInterface;
use Mockery;

class InventoryTest extends TestCase
{
    protected $mockInventoryRepository;

    protected function setUp(): void
    {
        parent::setUp();
        $this->mockInventoryRepository = Mockery::mock(InventoryRepositoryInterface::class);
        $this->app->instance(InventoryRepositoryInterface::class, $this->mockInventoryRepository);
    }

    public function test_inventory_can_be_created()
    {
        $inventoryData = [
            'idUser' => 1,
            'url_foto' => 'test.jpg',
            'namaBahan' => 'Gula',
            'jumlahBahan' => 10,
            'jumlahSatuan' => 1,
            'tanggalInput' => '2024-03-20',
            'tanggalExp' => '2024-04-20',
            'idStatusBahan' => 1,
            'idSatuanBahan' => 1,
            'idJenisBahan' => 1,
            'idJenisKemasan' => 1
        ];

        $this->mockInventoryRepository
            ->shouldReceive('create')
            ->once()
            ->with($inventoryData)
            ->andReturn((object) $inventoryData);

        $inventory = $this->mockInventoryRepository->create($inventoryData);

        $this->assertEquals('Gula', $inventory->namaBahan);
        $this->assertEquals(10, $inventory->jumlahBahan);
    }

    public function test_inventory_can_be_read()
    {
        $inventoryId = 1;
        $inventoryData = (object) [
            'idInventory' => $inventoryId,
            'idUser' => 1,
            'url_foto' => 'test.jpg',
            'namaBahan' => 'Gula',
            'jumlahBahan' => 10,
            'jumlahSatuan' => 1,
            'tanggalInput' => '2024-03-20',
            'tanggalExp' => '2024-04-20',
            'idStatusBahan' => 1,
            'idSatuanBahan' => 1,
            'idJenisBahan' => 1,
            'idJenisKemasan' => 1
        ];

        $this->mockInventoryRepository
            ->shouldReceive('findById')
            ->once()
            ->with($inventoryId)
            ->andReturn($inventoryData);

        $inventory = $this->mockInventoryRepository->findById($inventoryId);

        $this->assertEquals($inventoryId, $inventory->idInventory);
        $this->assertEquals('Gula', $inventory->namaBahan);
    }

    public function test_inventory_can_be_updated()
    {
        $inventoryId = 1;
        $updateData = [
            'namaBahan' => 'Gula Pasir',
            'jumlahBahan' => 15
        ];
        $updatedInventoryData = (object) array_merge([
            'idInventory' => $inventoryId,
            'idUser' => 1,
            'url_foto' => 'test.jpg',
            'jumlahSatuan' => 1,
            'tanggalInput' => '2024-03-20',
            'tanggalExp' => '2024-04-20',
            'idStatusBahan' => 1,
            'idSatuanBahan' => 1,
            'idJenisBahan' => 1,
            'idJenisKemasan' => 1
        ], $updateData);

        $this->mockInventoryRepository
            ->shouldReceive('update')
            ->once()
            ->with($inventoryId, $updateData)
            ->andReturn($updatedInventoryData);

        $inventory = $this->mockInventoryRepository->update($inventoryId, $updateData);

        $this->assertEquals('Gula Pasir', $inventory->namaBahan);
        $this->assertEquals(15, $inventory->jumlahBahan);
    }

    public function test_inventory_can_be_deleted()
    {
        $inventoryId = 1;

        $this->mockInventoryRepository
            ->shouldReceive('delete')
            ->once()
            ->with($inventoryId)
            ->andReturn(true);

        $result = $this->mockInventoryRepository->delete($inventoryId);

        $this->assertTrue($result);
    }

    public function test_inventory_can_be_listed()
    {
        $inventoryList = [
            (object) [
                'idInventory' => 1,
                'namaBahan' => 'Gula',
                'jumlahBahan' => 10
            ],
            (object) [
                'idInventory' => 2,
                'namaBahan' => 'Garam',
                'jumlahBahan' => 5
            ]
        ];

        $this->mockInventoryRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($inventoryList);

        $result = $this->mockInventoryRepository->all();

        $this->assertCount(2, $result);
        $this->assertEquals('Gula', $result[0]->namaBahan);
        $this->assertEquals('Garam', $result[1]->namaBahan);
    }
}
