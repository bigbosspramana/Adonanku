<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('resep', function (Blueprint $table) {
            $table->id('idResep'); // Primary key
            $table->foreignId('idUser')->constrained('users')->onDelete('cascade');
            $table->string('namaResep', 45);
            $table->foreignId('idJenisKue')->constrained('jenis_kue')->onDelete('cascade');
            $table->foreignId('idCaraMasak')->constrained('cara_masak')->onDelete('cascade');
            $table->boolean('isPublic')->default(false); // true jika resep ingin dibagikan
            $table->integer('durasiMasak'); // durasi dalam menit
            $table->timestamps(); // created_at, updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('resep');
    }
};
