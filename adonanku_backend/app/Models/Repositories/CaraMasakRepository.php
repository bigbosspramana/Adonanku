<?php

namespace App\Models\Repositories;

use App\Models\CaraMasak;

class CaraMasakRepository implements CaraMasakRepositoryInterface
{
    public function findById(string $id)
    {
        return CaraMasak::find($id);
    }

    public function create(array $data)
    {
        return CaraMasak::create($data);
    }

    public function update(string $id, array $data)
    {
        $caraMasak = $this->findById($id);
        if ($caraMasak) {
            $caraMasak->update($data);
            return $caraMasak;
        }
        return null;
    }

    public function delete(string $id)
    {
        $caraMasak = $this->findById($id);
        if ($caraMasak) {
            return $caraMasak->delete();
        }
        return false;
    }

    public function all()
    {
        return CaraMasak::all();
    }
}
