<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;

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
});

