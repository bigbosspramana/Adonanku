<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Konversi extends Model
{
    use HasFactory;

    protected $table = 'konversi';
    protected $primaryKey = 'idKonversi';
    public $timestamps = true;

    protected $fillable = [
        'namaKonversi',
        'jumlahKonversi',
        'idUser',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'idUser');
    }

    public function resep()
    {
        return $this->belongsToMany(Resep::class, 'konversi_resep', 'idKonversi', 'idResep')
                    ->withTimestamps();
    }

    public function hasilKonversi()
    {
        return $this->hasMany(HasilKonversi::class, 'idKonversi');
    }

}
