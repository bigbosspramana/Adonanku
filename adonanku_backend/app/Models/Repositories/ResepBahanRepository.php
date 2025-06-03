<?php

namespace App\Models\Repositories;

use App\Models\ResepBahan;

class ResepBahanRepository implements ResepBahanInterface
{
    public function findById(string $id)
    {
        return ResepBahan::find($id);
    }

    public function create(array $data)
    {
        return ResepBahan::create($data);
    }

    public function update(string $id, array $data)
    {
        $resepBahan = $this->findById($id);
        if ($resepBahan) {
            $resepBahan->update($data);
            return $resepBahan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $resepBahan = $this->findById($id);
        if ($resepBahan) {
            return $resepBahan->delete();
        }
        return false;
    }

    public function all()
    {
        return ResepBahan::all();
    }
}
