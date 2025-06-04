<?php

namespace App\Models\Repositories;

use App\Models\StatusBahan;

class StatusBahanRepository implements StatusBahanRepositoryInterface
{
    public function findById(string $id)
    {
        return StatusBahan::find($id);
    }

    public function create(array $data)
    {
        return StatusBahan::create($data);
    }

    public function update(string $id, array $data)
    {
        $statusBahan = StatusBahan::find($id);
        if ($statusBahan) {
            $statusBahan->update($data);
            return $statusBahan;
        }
        return null;
    }

    public function delete(string $id)
    {
        $statusBahan = StatusBahan::find($id);
        if ($statusBahan) {
            $statusBahan->delete();
            return true;
        }
        return false;
    }

    public function all()
    {
        return StatusBahan::all();
    }
}
