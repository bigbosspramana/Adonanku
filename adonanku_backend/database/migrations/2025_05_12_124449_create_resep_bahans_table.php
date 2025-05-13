<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('resep_bahan', function (Blueprint $table) {
            $table->unsignedBigInteger('idBahan'); // Kolom untuk foreign key ke bahan
            $table->foreign('idBahan')
                ->references('idBahan') // Kolom yang dirujuk pada tabel bahan
                ->on('bahan') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
            $table->unsignedBigInteger('idResep'); // Kolom untuk foreign key ke bahan
            $table->foreign('idResep')
                ->references('idResep') // Kolom yang dirujuk pada tabel bahan
                ->on('resep') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
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
