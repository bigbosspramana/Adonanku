<?php

namespace App\Http\Controllers;

use App\Models\Konversi;
use App\Models\HasilKonversi;
use App\Models\KonversiResep;
use App\Models\Resep;
use App\Models\ResepBahan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class KonversiController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'idResep' => 'required|exists:resep,idResep',
            'jumlahKonversi' => 'required|numeric|min:1',
            'namaKonversi' => 'required|string|max:255',
        ]);

        DB::beginTransaction();

        try {
            // Buat entri konversi
            $konversi = Konversi::create([
                'namaKonversi' => $request->namaKonversi,
                'jumlahKonversi' => $request->jumlahKonversi,
                'idUser' => Auth::id(),
            ]);

            // Tambahkan ke tabel pivot konversi_resep
            KonversiResep::create([
                'idKonversi' => $konversi->idKonversi,
                'idResep' => $request->idResep,
            ]);

            // Ambil semua bahan dari resep
            $resepBahanList = ResepBahan::where('idResep', $request->idResep)->get();

            if ($resepBahanList->isEmpty()) {
                DB::rollBack();
                return response()->json(['message' => 'Resep tidak memiliki bahan.'], 400);
            }

            foreach ($resepBahanList as $resepBahan) {
                if ($resepBahan->jumlahBahan === null) {
                    DB::rollBack();
                    return response()->json(['message' => 'jumlahBahan null pada salah satu bahan.'], 400);
                }

                HasilKonversi::create([
                    'idKonversi' => $konversi->idKonversi,
                    'idBahan' => $resepBahan->idBahan,
                    'jumlahAsli' => $resepBahan->jumlahBahan,
                    'jumlahHasil' => $resepBahan->jumlahBahan * $request->jumlahKonversi,
                ]);
            }

            DB::commit();

            return response()->json([
                'message' => 'Konversi berhasil disimpan.',
                'konversi' => $konversi
            ]);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'message' => 'Gagal menyimpan konversi.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Menampilkan semua konversi milik user yang sedang login
    public function konversisByUser($idUser)
    {
        $konversis = Konversi::with(['resep', 'hasilKonversi'])
            ->where('idUser', $idUser)
            ->get();

        if ($konversis->isEmpty()) {
            return response()->json([
                'message' => 'Tidak ada data konversi untuk user ini.'
            ], 404);
        }

        return response()->json([
            'message' => 'Data konversi milik user',
            'data' => $konversis
        ]);
    }


    public function showByIdKonversi($idKonversi)
    {
        $konversi = Konversi::with(['resep', 'hasilKonversi'])->find($idKonversi);

        if (!$konversi) {
            return response()->json([
                'message' => 'Data konversi tidak ditemukan.'
            ], 404);
        }

        return response()->json([
            'message' => 'Detail konversi ditemukan.',
            'data' => $konversi
        ]);
    }

    // Menghapus konversi beserta hasil konversi dan relasi konversi_resep
    public function destroy($idKonversi)
    {
        $konversi = Konversi::find($idKonversi);

        if (!$konversi) {
            return response()->json(['message' => 'Konversi tidak ditemukan'], 404);
        }

        DB::beginTransaction();

        try {
            // Hapus data terkait
            HasilKonversi::where('idKonversi', $idKonversi)->delete();
            KonversiResep::where('idKonversi', $idKonversi)->delete();
            $konversi->delete();

            DB::commit();

            return response()->json(['message' => 'Konversi berhasil dihapus.']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Gagal menghapus konversi', 'error' => $e->getMessage()], 500);
        }
    }

    // Mengupdate namaKonversi dan jumlahKonversi
    public function update(Request $request, $idKonversi)
    {
        $request->validate([
            'namaKonversi' => 'sometimes|required|string|max:255',
            'jumlahKonversi' => 'sometimes|required|numeric|min:1',
        ]);

        $konversi = Konversi::find($idKonversi);

        if (!$konversi) {
            return response()->json(['message' => 'Konversi tidak ditemukan'], 404);
        }

        DB::beginTransaction();

        try {
            // Simpan perubahan pada konversi
            $konversi->update($request->only(['namaKonversi', 'jumlahKonversi']));

            // Update hasil konversi jika jumlahKonversi diubah
            if ($request->has('jumlahKonversi')) {
                $hasilList = HasilKonversi::where('idKonversi', $idKonversi)->get();

                foreach ($hasilList as $hasil) {
                    $jumlahAsli = $hasil->jumlahAsli;
                    $hasil->jumlahHasil = $jumlahAsli * $request->jumlahKonversi;
                    $hasil->save();
                }
            }

            DB::commit();

            return response()->json(['message' => 'Konversi berhasil diperbarui', 'konversi' => $konversi]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Gagal memperbarui konversi', 'error' => $e->getMessage()], 500);
        }
    }

}
