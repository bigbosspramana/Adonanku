<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilKonversi extends Model
{
    use HasFactory;

    protected $table = 'hasil_konversi';
    protected $primaryKey = 'idKonversiBahan';

    protected $fillable = [
        'idKonversi',
        'idBahan',
        'jumlahAsli',
        'jumlahHasil',
    ];

    // Relasi ke model Konversi
    public function konversi()
    {
        return $this->belongsTo(Konversi::class, 'idKonversi', 'idKonversi');
    }

    // Relasi ke model Bahan
    public function bahan()
    {
        return $this->belongsTo(Bahan::class, 'idBahan', 'idBahan');
    }
}
