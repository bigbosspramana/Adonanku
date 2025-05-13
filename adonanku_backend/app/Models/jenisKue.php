<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JenisKue extends Model
{
    use HasFactory;

    protected $table = 'jenis_kue';
    protected $primaryKey = 'idJenisKue';
    public $timestamps = true;

    protected $fillable = ['jenisKue'];

    public function resep()
    {
        return $this->hasMany(Resep::class, 'idJenisKue');
    }
}
