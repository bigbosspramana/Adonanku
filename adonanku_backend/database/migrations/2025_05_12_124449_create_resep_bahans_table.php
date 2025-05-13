<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('resep_bahan', function (Blueprint $table) {
            $table->foreignId('idBahan')->references('idBahan')->on('bahan')->onDelete('cascade');
            $table->foreignId('idResep')->references('idResep')->on('resep')->onDelete('cascade');
            $table->integer('jumlahBahan');
            $table->timestamps();

            // Composite primary key
            $table->primary(['idBahan', 'idResep']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('resep_bahan');
    }
};
