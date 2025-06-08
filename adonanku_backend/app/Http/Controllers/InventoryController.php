<?php

namespace App\Http\Controllers;

use App\Models\Inventory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class InventoryController extends Controller
{
    /**
     * Tampilkan semua data inventory (dengan filter opsional).
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        try {
            $query = Inventory::query();

            if ($request->has('idUser')) {
                $query->where('idUser', $request->idUser);
            }

            if ($request->has('sortBy')) {
                $query->orderBy($request->get('sortBy'), $request->get('direction', 'asc'));
            }

            $inventories = $query->get();

            return response()->json(['inventories' => $inventories]);
        } catch (\Exception $e) {
            Log::error('Error saat mengambil inventory: ' . $e->getMessage());
            return response()->json(['message' => 'Terjadi kesalahan saat mengambil data'], 500);
        }
    }

    /**
     * Tampilkan semua inventory milik user berdasarkan idUser.
     *
     * @param int $idUser
     * @return \Illuminate\Http\JsonResponse
     */
    public function getByUserId($idUser)
    {
        $inventories = Inventory::with([
            'statusBahan',
            'satuanBahan',
            'jenisBahan',
            'jenisKemasan'
        ])->where('idUser', $idUser)->get();

        if ($inventories->isEmpty()) {
            return response()->json(['message' => 'Inventory untuk user ini tidak ditemukan'], 404);
        }

        return response()->json(['inventories' => $inventories]);
    }


    /**
     * Tampilkan data inventory berdasarkan ID.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        try {
            $inventory = Inventory::find($id);

            if (!$inventory) {
                return response()->json(['message' => 'Inventory tidak ditemukan'], 404);
            }

            return response()->json(['inventory' => $inventory]);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Terjadi kesalahan saat mengambil data'], 500);
        }
    }

    /**
     * Simpan data inventory baru ke database.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
{
    try {
        // Validasi input tanpa idStatusBahan dan idBahan karena nanti generate
        $validated = $request->validate([
            'idUser' => 'required|exists:users,id',
            'url_foto' => 'required|string|max:500',
            'namaBahan' => 'required|string|max:45',
            'jumlahBahan' => 'required|integer',
            'jumlahSatuan' => 'required|integer',
            'tanggalInput' => 'required|date',
            'tanggalExp' => 'required|date',
            'idJenisBahan' => 'required|exists:jenis_bahan,idJenisBahan',
            'idSatuanBahan' => 'required|exists:satuan_bahan,idSatuanBahan',
            'idJenisKemasan' => 'required|exists:jenis_kemasan,idJenisKemasan',
        ]);

        // Cari bahan berdasarkan namaBahan (case insensitive)
        $bahan = \App\Models\Bahan::where('namaBahan', 'LIKE', $validated['namaBahan'])->first();

        // Jika belum ada bahan, buat baru
        if (!$bahan) {
            $bahan = \App\Models\Bahan::create([
                'namaBahan' => $validated['namaBahan'],
                // isi field lain jika ada wajib
            ]);
        }

        // Mapping status
        $statusMapping = [
            'stok habis' => 1,
            'stok menipis' => 2,
            'stok menipis, mendekati kadaluwarsa' => 3,
            'sudah kadaluwarsa' => 4,
            'stok aman, mendekati kadaluwarsa' => 5,
            'aman' => 6,
        ];

        // Tentukan stok dan exp status
        if ($validated['jumlahBahan'] <= 0) {
            $stokStatus = 'stok habis';
        } elseif ($validated['jumlahBahan'] <= 5) {
            $stokStatus = 'stok menipis';
        } else {
            $stokStatus = 'stok aman';
        }

        $today = new \DateTime();
        $tanggalExp = new \DateTime($validated['tanggalExp']);
        $diffDays = (int)$today->diff($tanggalExp)->format('%r%a');

        if ($diffDays < 0) {
            $expStatus = 'sudah kadaluwarsa';
        } elseif ($diffDays <= 7) {
            $expStatus = 'mendekati kadaluwarsa';
        } else {
            $expStatus = 'aman';
        }

        if ($stokStatus === 'stok habis') {
            $statusGabungan = 'stok habis';
        } elseif ($stokStatus === 'stok menipis' && $expStatus === 'mendekati kadaluwarsa') {
            $statusGabungan = 'stok menipis, mendekati kadaluwarsa';
        } elseif ($expStatus === 'sudah kadaluwarsa') {
            $statusGabungan = 'sudah kadaluwarsa';
        } elseif ($stokStatus === 'stok menipis') {
            $statusGabungan = 'stok menipis';
        } elseif ($stokStatus === 'stok aman' && $expStatus === 'mendekati kadaluwarsa') {
            $statusGabungan = 'stok aman, mendekati kadaluwarsa';
        } else {
            $statusGabungan = 'aman';
        }

        // Buat data lengkap untuk simpan
        $dataToInsert = $validated;
        $dataToInsert['idStatusBahan'] = $statusMapping[$statusGabungan];
        $dataToInsert['idBahan'] = $bahan->idBahan;

        // Simpan ke tabel inventory
        $inventory = \App\Models\Inventory::create($dataToInsert);

        return response()->json([
            'message' => 'Inventory berhasil dibuat',
            'inventory' => $inventory,
            'status' => $statusGabungan,
        ], 201);

    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Terjadi kesalahan saat membuat inventory',
            'error' => $e->getMessage(),
        ], 500);
    }
}




    /**
     * Update data inventory berdasarkan ID.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        try {
            $inventory = Inventory::find($id);

            if (!$inventory) {
                return response()->json(['message' => 'Inventory tidak ditemukan'], 404);
            }

            $validated = $request->validate([
                'idUser' => 'required|exists:users,id',
                'url_foto' => 'sometimes|string|max:500',
                'namaBahan' => 'required|string|max:45',
                'jumlahBahan' => 'required|integer',
                'jumlahSatuan' => 'required|integer',
                'tanggalInput' => 'required|date',
                'tanggalExp' => 'required|date',
                'idStatusBahan' => 'required|exists:status_bahan,idStatusBahan',
                'idJenisBahan' => 'required|exists:jenis_bahan,idJenisBahan',
                'idSatuanBahan' => 'required|exists:satuan_bahan,idSatuanBahan',
                'idJenisKemasan' => 'required|exists:jenis_kemasan,idJenisKemasan',
            ]);

            $inventory->update($validated);

            return response()->json([
                'message' => 'Inventory berhasil diperbarui',
                'inventory' => $inventory
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan saat memperbarui inventory',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * Hapus data inventory berdasarkan ID.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        try {
            $inventory = Inventory::find($id);

            if (!$inventory) {
                return response()->json(['message' => 'Inventory tidak ditemukan'], 404);
            }

            $inventory->delete();

            return response()->json(['message' => 'Inventory berhasil dihapus']);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Terjadi kesalahan saat menghapus inventory',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
