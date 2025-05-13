<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('konversi', function (Blueprint $table) {
            $table->id('idKonversi'); // Primary key
            $table->string('namaKonversi', 100); // contoh: "1 sdm ke gram"
            $table->integer('jumlahKonversi'); // nilai konversinya
            $table->foreignId('idUser')->constrained('users')->onDelete('cascade'); // pemilik konversi
            $table->timestamps(); // created_at & updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('konversi');
    }
};
