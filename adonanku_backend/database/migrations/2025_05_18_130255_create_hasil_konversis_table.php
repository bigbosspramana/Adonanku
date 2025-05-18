<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('hasil_konversi', function (Blueprint $table) {
            $table->id('idKonversiBahan');
            $table->unsignedBigInteger('idKonversi');
            $table->unsignedBigInteger('idBahan');
            $table->integer('jumlahAsli');
            $table->integer('jumlahHasil');
            $table->timestamps();

            $table->foreign('idKonversi')->references('idKonversi')->on('konversi')->onDelete('cascade');
            $table->foreign('idBahan')->references('idBahan')->on('bahan')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('hasil_konversi');
    }
};
