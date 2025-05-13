<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('bahan', function (Blueprint $table) {
            $table->id('idBahan'); // Primary key untuk bahan
            $table->string('namaBahan', 100);
            $table->integer('jumlahBahan');
            $table->foreignID('idSatuanBahan')->references('idSatuanBahan')->on('satuan_bahan')->onDelete('cascade');
            $table->foreignId('idInventory')->references('idInventory')->on('inventory')->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('bahan');
    }
};
