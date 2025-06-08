<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('inventory', function (Blueprint $table) {
            $table->id('idInventory'); // Primary key
            $table->foreignId('idUser')->constrained('users')->onDelete('cascade'); // Aturan hapus cascade
            $table->string('url_foto', 500);
            $table->string('namaBahan', 45);
            $table->integer('jumlahBahan');
            $table->integer('jumlahSatuan');
            $table->string('tanggalInput', 45);
            $table->string('tanggalExp', 45);
            $table->foreignId('idBahan')->references('idBahan')->on('bahan')->onDelete('cascade');
            $table->foreignId('idStatusBahan')->references('idStatusBahan')->on('status_bahan')->onDelete('cascade');
            $table->foreignId('idJenisBahan')->references('idJenisBahan')->on('jenis_bahan')->onDelete('cascade');
            $table->foreignId('idSatuanBahan')->references('idSatuanBahan')->on('satuan_bahan')->onDelete('cascade');
            $table->foreignId('idJenisKemasan')->references('idJenisKemasan')->on('jenis_kemasan')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('inventory');
    }
};
