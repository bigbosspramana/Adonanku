<?php

namespace App\Http\Controllers;

use App\Models\LangkahMasak;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Exception;

class LangkahMasakController extends Controller
{
    public function index()
    {
        try {
            $data = LangkahMasak::all();
            return response()->json($data, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal mengambil data', 'error' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'idResep' => 'required|exists:resep,idResep',
                'urutanMasak' => 'required|integer',
                'deskripsi' => 'required|string',
            ]);

            $langkah = LangkahMasak::create($validated);

            return response()->json($langkah, 201);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal menambahkan data', 'error' => $e->getMessage()], 500);
        }
    }

    public function show($id)
    {
        try {
            $langkah = LangkahMasak::findOrFail($id);
            return response()->json($langkah, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal mengambil data', 'error' => $e->getMessage()], 500);
        }
    }

    public function showByResep($idResep)
    {
        try {
            $langkah = LangkahMasak::where('idResep', $idResep)
                ->orderBy('urutanMasak') // opsional: agar langkahnya berurutan
                ->get();

            if ($langkah->isEmpty()) {
                return response()->json(['message' => 'Tidak ada langkah masak untuk resep ini'], 404);
            }

            return response()->json($langkah, 200);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal mengambil data', 'error' => $e->getMessage()], 500);
        }
    }

    public function updateByResep(Request $request, $idResep)
    {
        try {
            $validated = $request->validate([
                'langkah' => 'required|array|min:1',
                'langkah.*.idLangkahMasak' => 'required|exists:langkah_masak,idLangkahMasak',
                'langkah.*.urutanMasak' => 'required|integer',
                'langkah.*.deskripsi' => 'required|string',
            ]);

            $updatedLangkahs = [];

            foreach ($validated['langkah'] as $item) {
                $langkah = LangkahMasak::where('idLangkahMasak', $item['idLangkahMasak'])
                    ->where('idResep', $idResep)
                    ->first();

                if ($langkah) {
                    $langkah->update([
                        'urutanMasak' => $item['urutanMasak'],
                        'deskripsi' => $item['deskripsi'],
                    ]);
                    $updatedLangkahs[] = $langkah;
                }
            }

            return response()->json([
                'message' => 'Langkah masak berhasil diperbarui',
                'data' => $updatedLangkahs
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'message' => 'Gagal memperbarui langkah masak',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function update(Request $request, $id)
    {
        try {
            $langkah = LangkahMasak::findOrFail($id);

            $validated = $request->validate([
                'idResep' => 'sometimes|exists:resep,idResep',
                'urutanMasak' => 'sometimes|integer',
                'deskripsi' => 'sometimes|string',
            ]);

            $langkah->update($validated);

            return response()->json($langkah, 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal mengupdate data', 'error' => $e->getMessage()], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $langkah = LangkahMasak::findOrFail($id);
            $langkah->delete();

            return response()->json(['message' => 'Langkah masak berhasil dihapus'], 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        } catch (Exception $e) {
            return response()->json(['message' => 'Gagal menghapus data', 'error' => $e->getMessage()], 500);
        }
    }
}
