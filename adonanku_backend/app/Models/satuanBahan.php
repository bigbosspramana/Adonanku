<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class SatuanBahan extends Model
{
    use HasFactory;

    protected $table = 'satuan_bahan';
    protected $primaryKey = 'idSatuanBahan';
    public $timestamps = true;

    protected $fillable = ['satuan'];

    public function bahan()
    {
        return $this->hasMany(Bahan::class, 'idSatuanBahan');
    }
}
