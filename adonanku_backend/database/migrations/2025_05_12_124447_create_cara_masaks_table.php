<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cara_masak', function (Blueprint $table) {
            $table->id('idCaraMasak'); // Primary key
            $table->string('caraMasak', 45); // contoh: 'Kukus', 'Oven', 'Goreng'
            $table->timestamps(); // created_at & updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cara_masak');
    }
};
