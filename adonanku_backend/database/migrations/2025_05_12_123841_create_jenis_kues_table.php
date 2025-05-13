<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('jenis_kue', function (Blueprint $table) {
            $table->id('idJenisKue'); // Primary key
            $table->string('jenisKue', 45); // Panjang 45 disesuaikan untuk umum
            $table->timestamps(); // created_at & updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('jenis_kue');
    }
};
