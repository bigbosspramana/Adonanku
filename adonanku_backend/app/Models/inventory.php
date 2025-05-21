<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Inventory extends Model
{
    use HasFactory;

    protected $table = 'inventory';

    protected $primaryKey = 'idInventory';

    public $timestamps = true;

    protected $fillable = [
        'idUser',
        'url_foto',
        'namaBahan',
        'jumlahBahan',
        'jumlahSatuan',
        'tanggalInput',
        'tanggalExp',
        'idStatusBahan',
        'idJenisBahan',
    ];

    /**
     * Relasi ke pengguna (User)
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'idUser');
    }

    /**
     * Relasi ke status bahan
     */
    public function statusBahan()
    {
        return $this->belongsTo(StatusBahan::class, 'idStatusBahan');
    }

    /**
     * Relasi ke jenis bahan
     */
    public function jenisBahan()
    {
        return $this->belongsTo(JenisBahan::class, 'idJenisBahan');
    }

    public function jenisKemasan()
    {
        return $this->belongsTo(JenisKemasan::class, 'idJenisKemasan');
    }
}
