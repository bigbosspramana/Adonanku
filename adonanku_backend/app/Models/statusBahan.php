<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class StatusBahanInventory extends Model
{
    use HasFactory;

    protected $table = 'status_bahan_inventory'; // nama tabel sesuai migrasi

    protected $primaryKey = 'idStatusBahan'; // kolom primary key non-standar

    public $timestamps = true; // jika kamu menggunakan timestamps di migrasi

    protected $fillable = ['status'];

    /**
     * Relasi ke inventory: satu status bisa digunakan banyak inventory
     */
    public function inventory()
    {
        return $this->hasMany(Inventory::class, 'idStatusBahan');
    }
}
