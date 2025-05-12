<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable; // jika menggunakan auth
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable;

    protected $table = 'users'; // nama tabel

    protected $primaryKey = 'id'; // opsional, default-nya sudah 'id'

    public $timestamps = true; // true jika menggunakan created_at dan updated_at

    protected $fillable = [
        'nama',
        'email',
        'username',
        'password',
    ];

    protected $hidden = [
        'password', // disembunyikan saat model dikonversi ke JSON
        'remember_token',
    ];

    /**
     * Relasi ke tabel lain (contoh ke Resep)
     */
    public function resep()
    {
        return $this->hasMany(Resep::class, 'idUser');
    }

    public function inventory()
    {
        return $this->hasMany(Inventory::class, 'idUser');
    }

    public function konversi()
    {
        return $this->hasMany(Konversi::class, 'idUser');
    }
}
