<?php

namespace App\Models\Repositories;

use App\Models\Inventory;

class InventoryRepository implements InventoryInterface
{
    public function findById(string $id)
    {
        return Inventory::find($id);
    }

    public function create(array $data)
    {
        return Inventory::create($data);
    }

    public function update(string $id, array $data)
    {
        $inventory = $this->findById($id);
        if ($inventory) {
            $inventory->update($data);
            return $inventory;
        }
        return null;
    }

    public function delete(string $id)
    {
        $inventory = $this->findById($id);
        if ($inventory) {
            return $inventory->delete();
        }
        return false;
    }

    public function all()
    {
        return Inventory::all();
    }
}
