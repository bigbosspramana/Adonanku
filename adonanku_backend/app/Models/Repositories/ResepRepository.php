<?php

namespace App\Models\Repositories;

use App\Models\Resep;

class ResepRepository implements ResepInterface
{
    public function findById(string $id)
    {
        return Resep::find($id);
    }

    public function create(array $data)
    {
        return Resep::create($data);
    }

    public function update(string $id, array $data)
    {
        $resep = $this->findById($id);
        if ($resep) {
            $resep->update($data);
            return $resep;
        }
        return null;
    }

    public function delete(string $id)
    {
        $resep = $this->findById($id);
        if ($resep) {
            return $resep->delete();
        }
        return false;
    }

    public function all()
    {
        return Resep::all();
    }
}
