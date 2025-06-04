<?php

namespace App\Models\Repositories;

use App\Models\SatuanBahan;

class SatuanBahanRepository implements SatuanBahanRepositoryInterface
{
    public function findById(string $id)
    {
        return SatuanBahan::find($id);
    }

    public function create(array $data)
    {
        return SatuanBahan::create($data);
    }

    public function update(string $id, array $data)
    {
        $satuanBahan = SatuanBahan::find($id);
        if ($satuanBahan) {
            $satuanBahan->update($data);
            return $satuanBahan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $satuanBahan = SatuanBahan::find($id);
        if ($satuanBahan) {
            $satuanBahan->delete();
            return true;
        }
        return false;
    }

    public function all()
    {
        return SatuanBahan::all();
    }
}
