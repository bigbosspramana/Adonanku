<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('bahan', function (Blueprint $table) {
            $table->id('idBahan'); // Primary key
            $table->string('namaBahan', 45);
            $table->foreignId('idSatuanBahan')->constrained('satuan_bahan')->onDelete('cascade');
            $table->foreignId('idInventory')->nullable()->constrained('inventory')->onDelete('set null');
            $table->timestamps(); // created_at, updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('bahan');
    }
};
