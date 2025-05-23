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
        'idSatuanBahan',
        'idJenisBahan',
        'idJenisKemasan'
    ];

    /**
     * Relasi ke pengguna (User)
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'idUser');
    }

    public function statusBahan()
    {
        return $this->belongsTo(StatusBahan::class, 'idStatusBahan', 'idStatusBahan');
    }

    public function satuanBahan()
    {
        return $this->belongsTo(SatuanBahan::class, 'idSatuanBahan', 'idSatuanBahan');
    }

    public function jenisBahan()
    {
        return $this->belongsTo(JenisBahan::class, 'idJenisBahan', 'idJenisBahan');
    }

    public function jenisKemasan()
    {
        return $this->belongsTo(JenisKemasan::class, 'idJenisKemasan', 'idJenisKemasan');
    }

}
