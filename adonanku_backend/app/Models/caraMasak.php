<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class CaraMasak extends Model
{
    use HasFactory;

    protected $table = 'cara_masak';
    protected $primaryKey = 'idCaraMasak';
    public $timestamps = true;

    protected $fillable = ['caraMasak'];

    public function resep()
    {
        return $this->hasMany(Resep::class, 'idCaraMasak');
    }
}
