import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/bahan_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BahanViewModel extends ChangeNotifier {
  // === MODEL ===
  BahanModel _bahan = BahanModel(
    nama: '',
    jumlah: 0,
    satuan: '',
    tanggalKadaluwarsa: DateTime.now(),
    jumlahSatuan: 0,
    imagePath: '',
  );

  BahanModel get bahan => _bahan;

  // === CONTROLLERS ===
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahSatuanController = TextEditingController();

  // === DROPDOWN SATUAN ===
  final List<String> satuanOptions = ['gram', 'kg', 'ml', 'liter'];
  String? selectedSatuan;

  // === GETTER TAMBAHAN ===
  String get imagePath => _bahan.imagePath;
  int get jumlah => _bahan.jumlah;

  // === SETTERS / UPDATERS ===
  void updateNama(String nama) {
    _bahan = _bahan.copyWith(nama: nama);
    notifyListeners();
  }

  // Digunakan oleh input manual dari TextField
  void updateJumlahFromText(String text) {
    final value = int.tryParse(text) ?? 0;
    _bahan = _bahan.copyWith(jumlah: value);
    notifyListeners();
  }

  // Digunakan oleh tombol + dan -
  void updateJumlah(int newJumlah) {
    if (newJumlah >= 0) {
      _bahan = _bahan.copyWith(jumlah: newJumlah);
      notifyListeners();
    }
  }

  void incrementJumlah() {
    updateJumlah(_bahan.jumlah + 1);
  }

  void decrementJumlah() {
    updateJumlah(_bahan.jumlah > 0 ? _bahan.jumlah - 1 : 0);
  }

  void updateSatuan(String satuan) {
    _bahan = _bahan.copyWith(satuan: satuan);
    notifyListeners();
  }

  void setSelectedSatuan(String? satuan) {
    selectedSatuan = satuan;
    if (satuan != null) {
      updateSatuan(satuan);
    }
  }

  void updateTanggal(DateTime tanggal) {
    _bahan = _bahan.copyWith(tanggalKadaluwarsa: tanggal);
    tanggalController.text = DateFormat('d MMMM yyyy').format(tanggal);
    notifyListeners();
  }

  void updateJumlahSatuan(String value) {
    final val = double.tryParse(value) ?? 0.0;
    _bahan = _bahan.copyWith(jumlahSatuan: val);
    notifyListeners();
  }

  // === IMAGE PICKER ===
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _bahan = _bahan.copyWith(imagePath: pickedFile.path);
      notifyListeners();
    }
  }

  // === SET AWAL (UNTUK EDIT) ===
  void setInitialValueFromModel(BahanModel model) {
    _bahan = model;
    namaController.text = model.nama;
    jumlahSatuanController.text = model.jumlahSatuan.toString();
    selectedSatuan = model.satuan;
    tanggalController.text =
        DateFormat('d MMMM yyyy').format(model.tanggalKadaluwarsa);
    notifyListeners();
  }

  // === SIMPAN DATA (SIMPULAN) ===
  void simpan() {
    _bahan = _bahan.copyWith(
      nama: namaController.text.trim(),
      jumlahSatuan: double.tryParse(jumlahSatuanController.text) ?? 0.0,
      satuan: selectedSatuan ?? '',
    );

    if (_bahan.nama.isEmpty || _bahan.satuan.isEmpty || _bahan.jumlah == 0) {
      debugPrint("❌ Gagal simpan: Isi semua field wajib!");
      return;
    }

    debugPrint("✅ Data disimpan: $_bahan");
  }

  @override
  void dispose() {
    namaController.dispose();
    tanggalController.dispose();
    jumlahSatuanController.dispose();
    super.dispose();
  }
}

final bahanViewModelProvider =
    ChangeNotifierProvider<BahanViewModel>((ref) => BahanViewModel());
