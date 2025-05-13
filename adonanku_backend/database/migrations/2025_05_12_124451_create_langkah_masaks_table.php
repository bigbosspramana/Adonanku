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
            $table->unsignedBigInteger('idResep'); // Kolom untuk foreign key ke bahan
            $table->foreign('idResep')
                ->references('idResep') // Kolom yang dirujuk pada tabel bahan
                ->on('resep') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
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
