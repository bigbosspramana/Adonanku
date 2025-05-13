<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('konversi_resep', function (Blueprint $table) {
            $table->foreignId('idKonversi')->references('idKonversi')->on('konversi')->onDelete('cascade');
            $table->foreignId('idResep')->references('idResep')->on('resep')->onDelete('cascade');
            $table->timestamps();

            // Composite primary key untuk mencegah duplikat
            $table->primary(['idKonversi', 'idResep']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('konversi_resep');
    }
};
