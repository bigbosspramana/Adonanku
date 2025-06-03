<?php

namespace App\Models\Repositories;

use App\Models\HasilKonversi;

class HasilKonversiRepository implements HasilKonversiInterface
{
    public function findById(string $id)
    {
        return HasilKonversi::find($id);
    }

    public function create(array $data)
    {
        return HasilKonversi::create($data);
    }

    public function update(string $id, array $data)
    {
        $hasilKonversi = $this->findById($id);
        if ($hasilKonversi) {
            $hasilKonversi->update($data);
            return $hasilKonversi;
        }
        return null;
    }

    public function delete(string $id)
    {
        $hasilKonversi = $this->findById($id);
        if ($hasilKonversi) {
            return $hasilKonversi->delete();
        }
        return false;
    }

    public function all()
    {
        return HasilKonversi::all();
    }
}
