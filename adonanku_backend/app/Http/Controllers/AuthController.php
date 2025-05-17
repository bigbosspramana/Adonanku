<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    // Register user baru
    public function register(Request $request)
    {
        try {
            $request->validate([
                'nama' => 'required|string|max:255',
                'username' => 'required|string|max:255|unique:users,username',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|confirmed|min:8',
            ]);

            $user = User::create([
                'nama' => $request->nama,
                'username' => $request->username,
                'email' => $request->email,
                'password' => bcrypt($request->password),
            ]);


            return response()->json(['message' => 'User berhasil didaftarkan', 'user' => $user], 201);
                } catch (ValidationException $ve) {
                    return response()->json(['errors' => $ve->errors()], 422);
                } catch (\Throwable $e) {
                    return response()->json(['message' => 'Registrasi gagal', 'error' => $e->getMessage()], 500);
                }
    }

    // Login user dan buat token
    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
                'password' => 'required|string',
            ]);

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                return response()->json(['message' => 'Email atau password salah'], 401);
            }

            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'message' => 'Login berhasil',
                'access_token' => $token,
                'token_type' => 'Bearer',
            ]);
        } catch (ValidationException $ve) {
            return response()->json(['errors' => $ve->errors()], 422);
        } catch (\Throwable $e) {
            return response()->json(['message' => 'Login gagal', 'error' => $e->getMessage()], 500);
        }
    }

    // Logout user (hapus token)
    public function logout(Request $request)
    {
        try {
            $user = $request->user();

            if ($user) {
                $user->currentAccessToken()->delete();
                return response()->json(['message' => 'Logout berhasil']);
            }

            return response()->json(['message' => 'User tidak ditemukan'], 404);
        } catch (\Throwable $e) {
            return response()->json(['message' => 'Logout gagal', 'error' => $e->getMessage()], 500);
        }
    }

    // Cek profile user (protected route)
    public function profile(Request $request)
    {
        return response()->json(['user' => $request->user()]);
    }
}
