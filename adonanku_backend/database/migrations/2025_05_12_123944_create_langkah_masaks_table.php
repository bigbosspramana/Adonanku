<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('langkah_masak', function (Blueprint $table) {
            $table->id('idLangkahMasak'); // Primary key
            $table->foreignId('idResep')->constrained('resep')->onDelete('cascade');
            $table->integer('urutanMasak'); // step ke-berapa
            $table->string('deskripsi', 500);
            $table->timestamps(); // created_at, updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('langkah_masak');
    }
};
