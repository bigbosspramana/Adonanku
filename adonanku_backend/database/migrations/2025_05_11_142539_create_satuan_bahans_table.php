<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('satuan_bahan', function (Blueprint $table) {
            $table->id('idSatuanBahan');
            $table->string('satuan', 45);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('satuan_bahan');
    }
};
