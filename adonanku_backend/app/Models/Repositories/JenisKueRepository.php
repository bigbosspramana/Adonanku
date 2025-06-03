<?php

namespace App\Models\Repositories;

use App\Models\JenisKue;

class JenisKueRepository implements JenisKueInterface
{
    public function findById(string $id)
    {
        return JenisKue::find($id);
    }

    public function create(array $data)
    {
        return JenisKue::create($data);
    }

    public function update(string $id, array $data)
    {
        $jenisKue = $this->findById($id);
        if ($jenisKue) {
            $jenisKue->update($data);
            return $jenisKue;
        }
        return null;
    }

    public function delete(string $id)
    {
        $jenisKue = $this->findById($id);
        if ($jenisKue) {
            return $jenisKue->delete();
        }
        return false;
    }

    public function all()
    {
        return JenisKue::all();
    }
}
