<?php

namespace App\Models\Repositories;

use App\Models\JenisBahan;

class JenisBahanRepository implements JenisBahanInterface
{
    public function findById(string $id)
    {
        return JenisBahan::find($id);
    }

    public function create(array $data)
    {
        return JenisBahan::create($data);
    }

    public function update(string $id, array $data)
    {
        $jenisBahan = $this->findById($id);
        if ($jenisBahan) {
            $jenisBahan->update($data);
            return $jenisBahan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $jenisBahan = $this->findById($id);
        if ($jenisBahan) {
            return $jenisBahan->delete();
        }
        return false;
    }

    public function all()
    {
        return JenisBahan::all();
    }
}
