<?php

// app/Http/Middleware/Auth.php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Laravel\Sanctum\PersonalAccessToken;

class Auth
{
    public function handle(Request $request, Closure $next): Response
    {
        try {
            $header = $request->header('Authorization');

            if (!$header || !str_starts_with($header, 'Bearer ')) {
                return response()->json(['message' => 'Token tidak ditemukan'], 401);
            }

            $token = substr($header, 7);
            $accessToken = PersonalAccessToken::findToken($token);

            if (!$accessToken || !$accessToken->tokenable) {
                return response()->json(['message' => 'Token tidak valid'], 401);
            }

            // Set user
            $user = $accessToken->tokenable;
            $request->setUserResolver(fn () => $user);

            return $next($request);
        } catch (\Throwable $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan saat autentikasi',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
