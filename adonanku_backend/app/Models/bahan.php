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
        'idSatuanBahan',
        'idInventory',
    ];

    public function satuanBahan()
    {
        return $this->belongsTo(SatuanBahan::class, 'idSatuanBahan');
    }

    public function inventory()
    {
        return $this->belongsTo(Inventory::class, 'idInventory');
    }

    public function resep()
    {
        return $this->belongsToMany(Resep::class, 'resep_bahan', 'idBahan', 'idResep')
                    ->withPivot('jumlahBahan')
                    ->withTimestamps();
    }
}
