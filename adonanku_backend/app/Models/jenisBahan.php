<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JenisBahan extends Model
{
    use HasFactory;

    protected $table = 'jenis_bahan'; // nama tabel sesuai migrasi

    protected $primaryKey = 'idJenisBahan'; // primary key non-standar

    public $timestamps = true; // karena di migrasi ada timestamps

    protected $fillable = ['jenisBahan'];

    /**
     * Relasi ke inventory (jika kamu ingin akses inventory berdasarkan jenis bahan)
     */
    public function inventory()
    {
        return $this->hasMany(Inventory::class, 'idJenisBahan');
    }
}
