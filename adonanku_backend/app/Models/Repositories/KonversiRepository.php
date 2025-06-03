<?php

namespace App\Models\Repositories;

use App\Models\Konversi;

class KonversiRepository implements KonversiResepInterface
{
    public function findById(string $id)
    {
        return Konversi::find($id);
    }

    public function create(array $data)
    {
        return Konversi::create($data);
    }

    public function update(string $id, array $data)
    {
        $konversi = $this->findById($id);
        if ($konversi) {
            $konversi->update($data);
            return $konversi;
        }
        return null;
    }

    public function delete(string $id)
    {
        $konversi = $this->findById($id);
        if ($konversi) {
            return $konversi->delete();
        }
        return false;
    }

    public function all()
    {
        return Konversi::all();
    }
}
