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
            $table->foreignID('idJenisKue')->references('idJenisKue')->on('jenis_kue')->onDelete('cascade');
            $table->foreignID('idCaraMasak')->references('idCaraMasak')->on('cara_masak')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('resep');
    }
};
