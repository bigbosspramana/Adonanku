<?php

namespace App\Models\Repositories;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserRepository implements UserRepositoryInterface
{
    public function findByEmail(string $email)
    {
        return User::where('email', $email)->first();
    }

    public function create(array $data)
    {
        $data['password'] = Hash::make($data['password']);
        return User::create($data);
    }

    public function findById(string $id)
    {
        return User::find($id);
    }

    public function update(string $id, array $data)
    {
        $user = User::find($id);
        if ($user) {
            $user->update($data);
            return $user;
        }
        return null;
    }

    public function delete(string $id)
    {
        $user = User::find($id);
        if ($user) {
            $user->delete();
            return true;
        }
        return false;
    }

    public function all()
    {
        return User::all();
    }
}
