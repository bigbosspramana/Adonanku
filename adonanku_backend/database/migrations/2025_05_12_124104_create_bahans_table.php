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
            $table->unsignedBigInteger('idSatuanBahan'); // Kolom untuk foreign key ke satuan_bahan
            $table->foreign('idSatuanBahan')
                ->references('idSatuanBahan') // Kolom yang dirujuk pada tabel satuan_bahan
                ->on('satuan_bahan') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
            $table->unsignedBigInteger('idInventory'); // Kolom untuk foreign key ke inventory
            $table->foreign('idInventory')
                ->references('idInventory') // Kolom yang dirujuk pada tabel inventory
                ->on('inventory') // Tabel yang dirujuk
                ->onDelete('cascade'); // Aturan delete cascade
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('bahan');
    }
};
