<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

// Public (tidak butuh token)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']); // Jangan pakai route name kalau untuk API

// Butuh token (pakai Sanctum)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/profile', [AuthController::class, 'profile']);
});

