<?php

namespace App\Models\Repositories;

use App\Models\Bahan;

class BahanRepository implements BahanRepositoryInterface
{
    public function findById(string $id)
    {
        return Bahan::find($id);
    }

    public function create(array $data)
    {
        return Bahan::create($data);
    }

    public function update(string $id, array $data)
    {
        $bahan = $this->findById($id);
        if ($bahan) {
            $bahan->update($data);
            return $bahan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $bahan = $this->findById($id);
        if ($bahan) {
            return $bahan->delete();
        }
        return false;
    }

    public function all()
    {
        return Bahan::all();
    }
}
