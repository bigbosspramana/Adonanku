<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ResepBahan extends Model
{
    use HasFactory;

    protected $table = 'resep_bahan';

    public $timestamps = true;

    protected $fillable = [
        'idResep',
        'idBahan',
        'jumlahBahan',
    ];

    /**
     * Relasi ke model Resep
     */
    public function resep()
    {
        return $this->belongsTo(Resep::class, 'idResep');
    }

    /**
     * Relasi ke model Bahan
     */
    public function bahan()
    {
        return $this->belongsTo(Bahan::class, 'idBahan');
    }
}
