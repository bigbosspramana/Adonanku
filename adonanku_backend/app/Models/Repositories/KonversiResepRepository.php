<?php

namespace App\Models\Repositories;

use App\Models\KonversiResep;

class KonversiResepRepository implements KonversiResepRepositoryInterface
{
    public function findById(string $id)
    {
        return KonversiResep::find($id);
    }

    public function create(array $data)
    {
        return KonversiResep::create($data);
    }

    public function update(string $id, array $data)
    {
        $konversiResep = $this->findById($id);
        if ($konversiResep) {
            $konversiResep->update($data);
            return $konversiResep;
        }
        return null;
    }

    public function delete(string $id)
    {
        $konversiResep = $this->findById($id);
        if ($konversiResep) {
            return $konversiResep->delete();
        }
        return false;
    }

    public function all()
    {
        return KonversiResep::all();
    }
}
