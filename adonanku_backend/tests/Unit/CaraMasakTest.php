<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Models\CaraMasak;
use App\Models\Repositories\CaraMasakRepositoryInterface;
use Mockery;

class CaraMasakTest extends TestCase
{
    protected $caraMasakRepository;

    public function setUp(): void
    {
        parent::setUp();
        $this->caraMasakRepository = Mockery::mock(CaraMasakRepositoryInterface::class);
        $this->app->instance(CaraMasakRepositoryInterface::class, $this->caraMasakRepository);
    }

    public function test_can_create_cara_masak()
    {
        $data = [
            'caraMasak' => 'Goreng dengan minyak panas'
        ];

        $caraMasak = new CaraMasak($data);

        $this->caraMasakRepository
            ->shouldReceive('create')
            ->with($data)
            ->once()
            ->andReturn($caraMasak);

        $result = $this->caraMasakRepository->create($data);

        $this->assertInstanceOf(CaraMasak::class, $result);
        $this->assertEquals($data['caraMasak'], $result->caraMasak);
    }

    public function test_can_find_cara_masak_by_id()
    {
        $caraMasak = new CaraMasak([
            'idCaraMasak' => '1',
            'caraMasak' => 'Goreng dengan minyak panas'
        ]);

        $this->caraMasakRepository
            ->shouldReceive('findById')
            ->with('1')
            ->once()
            ->andReturn($caraMasak);

        $result = $this->caraMasakRepository->findById('1');

        $this->assertInstanceOf(CaraMasak::class, $result);
        $this->assertEquals('1', $result->idCaraMasak);
    }

    public function test_can_update_cara_masak()
    {
        $data = [
            'caraMasak' => 'Rebus dengan air mendidih'
        ];

        $updatedCaraMasak = new CaraMasak([
            'idCaraMasak' => '1',
            'caraMasak' => 'Rebus dengan air mendidih'
        ]);

        $this->caraMasakRepository
            ->shouldReceive('update')
            ->with('1', $data)
            ->once()
            ->andReturn($updatedCaraMasak);

        $result = $this->caraMasakRepository->update('1', $data);

        $this->assertInstanceOf(CaraMasak::class, $result);
        $this->assertEquals($data['caraMasak'], $result->caraMasak);
    }

    public function test_can_delete_cara_masak()
    {
        $this->caraMasakRepository
            ->shouldReceive('delete')
            ->with('1')
            ->once()
            ->andReturn(true);

        $result = $this->caraMasakRepository->delete('1');

        $this->assertTrue($result);
    }

    public function test_can_get_all_cara_masak()
    {
        $caraMasakList = collect([
            new CaraMasak(['idCaraMasak' => '1', 'caraMasak' => 'Goreng']),
            new CaraMasak(['idCaraMasak' => '2', 'caraMasak' => 'Rebus'])
        ]);

        $this->caraMasakRepository
            ->shouldReceive('all')
            ->once()
            ->andReturn($caraMasakList);

        $result = $this->caraMasakRepository->all();

        $this->assertCount(2, $result);
    }

    public function tearDown(): void
    {
        Mockery::close();
        parent::tearDown();
    }
}