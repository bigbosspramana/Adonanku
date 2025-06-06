<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\ResepController;

// Public (tidak butuh token)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Butuh token (pakai Sanctum)
Route::middleware('auth:sanctum')->group(function () {
    // Auth
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/profile', [AuthController::class, 'profile']);

    // CRUD user routes
    Route::get('/users', [UserController::class, 'index']);          // Tampilkan semua user
    Route::post('/users', [UserController::class, 'store']);         // Tambah user
    Route::get('/users/{id}', [UserController::class, 'show']);      // Tampilkan user tertentu
    Route::put('/users/{id}', [UserController::class, 'update']);    // Update user
    Route::delete('/users/{id}', [UserController::class, 'destroy']); // Hapus user

    // CRUD Invetroy routes
    Route::get('/inventory', [InventoryController::class, 'index']);        // Tampilkan semua inventory
    Route::get('/inventory/user/{idUser}', [InventoryController::class, 'getByUserId']); // Tampilkan semua inventory berdasarkan id user
    Route::get('/inventory/{id}', [InventoryController::class, 'show']);    // Tampilkan inventory berdasarkan ID
    Route::post('/inventory', [InventoryController::class, 'store']);       // Tambah inventory baru
    Route::put('/inventory/{id}', [InventoryController::class, 'update']);  // Update inventory berdasarkan ID
    Route::delete('/inventory/{id}', [InventoryController::class, 'destroy']);// Hapus inventory berdasarkan ID

    // CRUD Resep routes
    Route::get('/reseps', [ResepController::class, 'index']);
    Route::get('/reseps/{id}', [ResepController::class, 'show']);
    Route::get('/reseps/user/{idUser}', [ResepController::class, 'resepsByUser']);
    Route::post('/reseps', [ResepController::class, 'store']);
    Route::put('/reseps/{id}', [ResepController::class, 'update']);
    Route::delete('/reseps/{id}', [ResepController::class, 'destroy']);
    Route::post('/reseps/{id}/masak', [ResepController::class, 'masak']); // membuat kue

});

