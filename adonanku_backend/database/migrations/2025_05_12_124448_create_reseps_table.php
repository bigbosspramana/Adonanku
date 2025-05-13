<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('resep', function (Blueprint $table) {
            $table->id('idResep'); // Primary key untuk resep
            $table->string('namaResep', 100);
            $table->unsignedBigInteger('idJenisKue'); // Kolom untuk foreign key ke jenis_kue
            $table->foreign('idJenisKue')
                ->references('idJenisKue') // Kolom yang dirujuk pada tabel jenis_kue
                ->on('jenis_kue') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
            $table->unsignedBigInteger('idCaraMasak'); // Kolom untuk foreign key ke cara_masak
            $table->foreign('idCaraMasak')
                ->references('idCaraMasak') // Kolom yang dirujuk pada tabel cara_masak
                ->on('cara_masak') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('resep');
    }
};
