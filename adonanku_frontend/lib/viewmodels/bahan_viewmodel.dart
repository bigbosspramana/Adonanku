import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/bahan_model.dart';

class BahanViewModel extends ChangeNotifier {
  late BahanModel _bahan;
  late final ImagePicker _picker;
  final TextEditingController jumlahController = TextEditingController();

  BahanViewModel({ImagePicker? picker})
      : _picker = picker ?? ImagePicker(),
        _bahan = BahanModel() {
    jumlahController.text = _bahan.jumlah.toString();
    jumlahController.addListener(() {
      final text = jumlahController.text;
      _bahan.jumlah = int.tryParse(text) ?? 0;
    });
  }

  BahanModel get bahan => _bahan;

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _bahan.fotoPath = pickedFile.path;
      notifyListeners();
    }
  }

  void setNama(String nama) {
    _bahan.nama = nama;
    notifyListeners();
  }

  void setTanggal(DateTime tanggal) {
    _bahan.tanggalKadaluwarsa = tanggal;
    notifyListeners();
  }

  void setJumlah(String value) {
    _bahan.jumlah = int.tryParse(value) ?? 0;
    jumlahController.text = _bahan.jumlah.toString();
    notifyListeners();
  }

  void incrementJumlah() {
    _bahan.jumlah++;
    jumlahController.text = _bahan.jumlah.toString();
    notifyListeners();
  }

  void decrementJumlah() {
    if (_bahan.jumlah > 0) {
      _bahan.jumlah--;
      jumlahController.text = _bahan.jumlah.toString();
      notifyListeners();
    }
  }

  void setJumlahSatuan(String value) {
    _bahan.jumlahSatuan = double.tryParse(value) ?? 0;
    notifyListeners();
  }

  void setSatuan(String satuan) {
    _bahan.satuan = satuan;
    notifyListeners();
  }

  void simpanData() {
    print("Data disimpan: ${_bahan.nama}, ${_bahan.jumlah} ${_bahan.satuan}");
  }

  @override
  void dispose() {
    jumlahController.dispose();
    super.dispose();
  }
}
