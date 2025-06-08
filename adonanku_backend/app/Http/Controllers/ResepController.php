<?php

namespace App\Http\Controllers;

use App\Models\Resep;
use App\Models\Bahan;
use App\Models\Inventory;
use App\Models\ResepBahan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;


class ResepController extends Controller
{
    public function index()
    {
        $reseps = Resep::with([
            'user',
            'jenisKue',
            'caraMasak',
            'langkahMasak',
            'resepBahan.bahan'
        ])->get();

        return response()->json($reseps);
    }

    public function show($id)
    {
        $resep = Resep::with([
            'user',
            'jenisKue',
            'caraMasak',
            'langkahMasak',
            'resepBahan.bahan'
        ])->findOrFail($id);

        return response()->json($resep);
    }

    public function resepsByUser($idUser)
    {
        $reseps = Resep::with([
            'user',
            'jenisKue',
            'caraMasak',
            'langkahMasak',
            'resepBahan.bahan'  // eager load relasi bahan dari pivot resep_bahan
        ])
        ->where('idUser', $idUser)
        ->get();

        return response()->json($reseps);
    }

    public function store(Request $request)
    {
        $request->validate([
            'idUser' => 'required|exists:users,id',
            'namaResep' => 'required|string',
            'idJenisKue' => 'required|exists:jenis_kue,idJenisKue',
            'idCaraMasak' => 'required|exists:cara_masak,idCaraMasak',
            'durasiMasak' => 'required|integer',
            'isPublic' => 'boolean',
            'bahan' => 'required|array',
            'bahan.*.namaBahan' => 'required|string',
            'bahan.*.jumlahBahan' => 'required|numeric'
        ]);

        DB::beginTransaction();

        try {
            // Simpan data resep
            $resepData = $request->only([
                'idUser', 'namaResep', 'idJenisKue', 'idCaraMasak', 'isPublic', 'durasiMasak'
            ]);
            $resep = Resep::create($resepData);

            $pivotData = [];

            foreach ($request->bahan as $bahanInput) {
                $namaBahan = strtolower(trim($bahanInput['namaBahan']));

                // Cari bahan atau buat jika belum ada
                $bahan = Bahan::firstOrCreate(['namaBahan' => $namaBahan]);

                // Siapkan data untuk insert pivot
                $pivotData[] = [
                    'idResep' => $resep->idResep,
                    'idBahan' => $bahan->idBahan,
                    'jumlahBahan' => $bahanInput['jumlahBahan'],
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            // Insert banyak data ke pivot tabel resep_bahan
            DB::table('resep_bahan')->insert($pivotData);

            DB::commit();

            // Load relasi bahan agar response lengkap
            $resep->load('bahan');

            return response()->json([
                'success' => true,
                'message' => 'Resep berhasil disimpan',
                'data' => $resep
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan resep: ' . $e->getMessage()
            ], 500);
        }
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'namaResep' => 'required|string',
            'idJenisKue' => 'required|exists:jenis_kue,idJenisKue',
            'idCaraMasak' => 'required|exists:cara_masak,idCaraMasak',
            'durasiMasak' => 'required|integer',
            'isPublic' => 'boolean',
            'bahan' => 'sometimes|required|array',
            'bahan.*.namaBahan' => 'required|string',
            'bahan.*.jumlahBahan' => 'required|numeric'
        ]);

        DB::beginTransaction();

        try {
            $resep = Resep::findOrFail($id);

            // Update data utama resep
            $resep->update($request->only([
                'namaResep', 'idJenisKue', 'idCaraMasak', 'isPublic', 'durasiMasak'
            ]));

            if ($request->has('bahan')) {
                // Hapus semua bahan lama di pivot tabel resep_bahan
                DB::table('resep_bahan')->where('idResep', $resep->idResep)->delete();

                $pivotData = [];

                foreach ($request->bahan as $bahanInput) {
                    $namaBahan = strtolower(trim($bahanInput['namaBahan']));

                    // Cari bahan atau buat baru jika belum ada
                    $bahan = Bahan::firstOrCreate(['namaBahan' => $namaBahan]);

                    // Siapkan data untuk insert batch pivot
                    $pivotData[] = [
                        'idResep' => $resep->idResep,
                        'idBahan' => $bahan->idBahan,
                        'jumlahBahan' => $bahanInput['jumlahBahan'],
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }

                // Insert pivot baru
                DB::table('resep_bahan')->insert($pivotData);
            }

            DB::commit();

            // Load relasi untuk response lengkap
            $resep->load(['user', 'jenisKue', 'caraMasak', 'bahan']);

            return response()->json([
                'success' => true,
                'message' => 'Resep berhasil diperbarui',
                'data' => $resep
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Gagal memperbarui resep: ' . $e->getMessage()
            ], 500);
        }
    }


    public function destroy($id)
    {
        $resep = Resep::findOrFail($id);
        $resep->bahan()->detach();
        $resep->delete();

        return response()->json(['message' => 'Resep berhasil dihapus']);
    }

    public function masak($idResep)
    {
        $resep = Resep::with('bahan')->findOrFail($idResep);
        $userId = Auth::id(); // user yang sedang login

        foreach ($resep->bahan as $bahan) {
            $jumlahDibutuhkan = $bahan->pivot->jumlahBahan;

            $inventory = Inventory::where('idUser', $userId)
                ->where('idBahan', $bahan->idBahan)
                ->where('jumlahBahan', '>=', $jumlahDibutuhkan)
                ->first();

            if (!$inventory) {
                return response()->json([
                    'error' => "Bahan '{$bahan->namaBahan}' tidak cukup di inventory user."
                ], 400);
            }
        }

        // Kurangi stok jika semua bahan cukup
        foreach ($resep->bahan as $bahan) {
            $jumlahDibutuhkan = $bahan->pivot->jumlahBahan;

            $inventory = Inventory::where('idUser', $userId)
                ->where('idBahan', $bahan->idBahan)
                ->first();

            $inventory->jumlahBahan -= $jumlahDibutuhkan;
            $inventory->save();
        }

        return response()->json([
            'message' => 'Kue berhasil dibuat dan stok bahan milik user berhasil dikurangi.'
        ]);
    }
}
