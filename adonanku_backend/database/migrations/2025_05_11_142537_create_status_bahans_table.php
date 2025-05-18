<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('status_bahan', function (Blueprint $table) {
            $table->id('idStatusBahan'); // Primary key
            $table->string('status', 45);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('status_bahan_inventory');
    }
};
