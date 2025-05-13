<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Resep extends Model
{
    use HasFactory;

    protected $table = 'resep';

    protected $primaryKey = 'idResep';

    public $timestamps = true;

    protected $fillable = [
        'idUser',
        'namaResep',
        'idJenisKue',
        'idCaraMasak',
        'isPublic',
        'durasiMasak',
    ];

    /**
     * Relasi ke User (pembuat resep)
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'idUser');
    }

    /**
     * Relasi ke JenisKue
     */
    public function jenisKue()
    {
        return $this->belongsTo(JenisKue::class, 'idJenisKue');
    }

    /**
     * Relasi ke CaraMasak
     */
    public function caraMasak()
    {
        return $this->belongsTo(CaraMasak::class, 'idCaraMasak');
    }

    /**
     * Relasi ke LangkahMasak (step by step)
     */
    public function langkahMasak()
    {
        return $this->hasMany(LangkahMasak::class, 'idResep');
    }

    /**
     * Relasi many-to-many ke Bahan melalui resep_bahan
     */
    public function bahan()
    {
        return $this->belongsToMany(Bahan::class, 'resep_bahan', 'idResep', 'idBahan')
                    ->withPivot('jumlahBahan')
                    ->withTimestamps();
    }

    /**
     * Relasi many-to-many ke Konversi melalui konversi_resep
     */
    public function konversi()
    {
        return $this->belongsToMany(Konversi::class, 'konversi_resep', 'idResep', 'idKonversi')
                    ->withTimestamps();
    }
}
