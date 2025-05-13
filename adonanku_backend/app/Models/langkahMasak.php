<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class LangkahMasak extends Model
{
    use HasFactory;

    protected $table = 'langkah_masak';
    protected $primaryKey = 'idLangkahMasak';
    public $timestamps = true;

    protected $fillable = [
        'idResep',
        'urutanMasak',
        'deskripsi',
    ];

    public function resep()
    {
        return $this->belongsTo(Resep::class, 'idResep');
    }
}
