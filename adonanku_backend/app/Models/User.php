<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use Notifiable, HasFactory; // Pastikan HasFactory ada di sini

    protected $table = 'users'; // Nama tabel

    protected $primaryKey = 'id'; // Opsional, default-nya sudah 'id'

    public $timestamps = true; // true jika menggunakan created_at dan updated_at

    protected $fillable = [
        'nama',
        'email',
        'username',
        'password',
    ];

    protected $hidden = [
        'password', // Disembunyikan saat model dikonversi ke JSON
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
