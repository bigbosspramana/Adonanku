<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class JenisKemasan extends Model
{
    use HasFactory;

    protected $table = 'jenis_kemasan';
    protected $primaryKey = 'idJenisKemasan';
    public $timestamps = true;

    protected $fillable = ['jenisKemasan'];

    public function inventory()
    {
        return $this->hasMany(Inventory::class, 'idJenisKemasan');
    }
}

