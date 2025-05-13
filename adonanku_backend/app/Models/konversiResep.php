<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class KonversiResep extends Model
{
    use HasFactory;

    protected $table = 'konversi_resep';

    public $timestamps = true;

    protected $fillable = [
        'idKonversi',
        'idResep',
    ];

    /**
     * Relasi ke Konversi
     */
    public function konversi()
    {
        return $this->belongsTo(Konversi::class, 'idKonversi');
    }

    /**
     * Relasi ke Resep
     */
    public function resep()
    {
        return $this->belongsTo(Resep::class, 'idResep');
    }
}
