<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Bahan extends Model
{
    use HasFactory;

    protected $table = 'bahan';
    protected $primaryKey = 'idBahan';
    public $timestamps = true;

    protected $fillable = [
        'namaBahan',
    ];

    public function resep()
    {
        return $this->belongsToMany(Resep::class, 'resep_bahan', 'idBahan', 'idResep')
                    ->withPivot('jumlahBahan')
                    ->withTimestamps();
    }

    public function inventory()
    {
        return $this->hasMany(Inventory::class, 'idBahan', 'idBahan');
    }

}
