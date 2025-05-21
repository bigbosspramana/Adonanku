<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('jenis_kemasan', function (Blueprint $table) {
            $table->id('idJenisKemasan'); // Kolom 'id' otomatis auto-increment dan primary key
            $table->string('jenisKemasan'); // Kolom untuk menyimpan jenis kemasan
            $table->timestamps(); // Kolom 'created_at' dan 'updated_at'
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jenis_kemasan');
    }
};
