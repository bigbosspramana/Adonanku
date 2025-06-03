<?php

namespace App\Models\Repositories;

use App\Models\JenisKemasan;

class JenisKemasanRepository implements JenisKemasanInterface
{
    public function findById(string $id)
    {
        return JenisKemasan::find($id);
    }

    public function create(array $data)
    {
        return JenisKemasan::create($data);
    }

    public function update(string $id, array $data)
    {
        $jenisKemasan = $this->findById($id);
        if ($jenisKemasan) {
            $jenisKemasan->update($data);
            return $jenisKemasan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $jenisKemasan = $this->findById($id);
        if ($jenisKemasan) {
            return $jenisKemasan->delete();
        }
        return false;
    }

    public function all()
    {
        return JenisKemasan::all();
    }
}
