<?php

namespace App\Models\Repositories;

use App\Models\LangkahMasak;

class LangkahMasakRepository implements LangkahMasakRepositoryInterface
{
    public function findById(string $id)
    {
        return LangkahMasak::find($id);
    }

    public function create(array $data)
    {
        return LangkahMasak::create($data);
    }

    public function update(string $id, array $data)
    {
        $langkahMasak = $this->findById($id);
        if ($langkahMasak) {
            $langkahMasak->update($data);
            return $langkahMasak;
        }
        return null;
    }

    public function delete(string $id)
    {
        $langkahMasak = $this->findById($id);
        if ($langkahMasak) {
            return $langkahMasak->delete();
        }
        return false;
    }

    public function all()
    {
        return LangkahMasak::all();
    }
}
