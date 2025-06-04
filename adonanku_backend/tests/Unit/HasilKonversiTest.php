<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\HasilKonversi;
use App\Models\Repositories\HasilKonversiRepositoryInterface;
use Mockery;

class HasilKonversiTest extends TestCase
{
    protected $hasilKonversiRepository;

    public function setUp(): void
    {
        parent::setUp();
        $this->hasilKonversiRepository = Mockery::mock(HasilKonversiRepositoryInterface::class);
        $this->app->instance(HasilKonversiRepositoryInterface::class, $this->hasilKonversiRepository);
    }

    public function test_can_create_hasil_konversi()
    {
        $data = [
            'idKonversi' => '1',
            'idBahan' => '1',
            'jumlahAsli' => 100,
            'jumlahHasil' => 50
        ];

        $hasilKonversi = new HasilKonversi($data);

        $this->hasilKonversiRepository
            ->shouldReceive('create')
            ->with($data)
            ->once()
            ->andReturn($hasilKonversi);

        $result = $this->hasilKonversiRepository->create($data);

        $this->assertInstanceOf(HasilKonversi::class, $result);
        $this->assertEquals($data['jumlahAsli'], $result->jumlahAsli);
        $this->assertEquals($data['jumlahHasil'], $result->jumlahHasil);
    }

    public function test_can_find_hasil_konversi_by_id()
    {
        $hasilKonversi = new HasilKonversi([
            'idKonversiBahan' => '1',
            'idKonversi' => '1',
            'idBahan' => '1',
            'jumlahAsli' => 100,
            'jumlahHasil' => 50
        ]);

        $this->hasilKonversiRepository
            ->shouldReceive('findById')
            ->with('1')
            ->once()
            ->andReturn($hasilKonversi);

        $result = $this->hasilKonversiRepository->findById('1');

        $this->assertInstanceOf(HasilKonversi::class, $result);
        $this->assertEquals('1', $result->idKonversiBahan);
    }

    public function test_can_update_hasil_konversi()
    {
        $data = [
            'jumlahAsli' => 200,
            'jumlahHasil' => 100
        ];

        $updatedHasilKonversi = new HasilKonversi([
            'idKonversiBahan' => '1',
            'idKonversi' => '1',
            'idBahan' => '1',
            'jumlahAsli' => 200,
            'jumlahHasil' => 100
        ]);

        $this->hasilKonversiRepository
            ->shouldReceive('update')
            ->with('1', $data)
            ->once()
            ->andReturn($updatedHasilKonversi);

        $result = $this->hasilKonversiRepository->update('1', $data);

        $this->assertInstanceOf(HasilKonversi::class, $result);
        $this->assertEquals($data['jumlahAsli'], $result->jumlahAsli);
        $this->assertEquals($data['jumlahHasil'], $result->jumlahHasil);
    }

    public function test_can_delete_hasil_konversi()
    {
        $this->hasilKonversiRepository
            ->shouldReceive('delete')
            ->with('1')
            ->once()
            ->andReturn(true);

        $result = $this->hasilKonversiRepository->delete('1');

        $this->assertTrue($result);
    }

    public function test_can_get_all_hasil_konversi()
    {
        $hasilKonversiList = collect([
            new HasilKonversi([
                'idKonversiBahan' => '1',
                'idKonversi' => '1',
                'idBahan' => '1',
                'jumlahAsli' => 100,
                'jumlahHasil' => 50
            ]),
            new HasilKonversi([
                'idKonversiBahan' => '2',
                'idKonversi' => '2',
                'idBahan' => '2',
                'jumlahAsli' => 200,
                'jumlahHasil' => 100
            ])
        ]);

        $this->hasilKonversiRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($hasilKonversiList);

        $result = $this->hasilKonversiRepository->all();

        $this->assertCount(2, $result);
    }

    public function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }
}
