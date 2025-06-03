import 'dart:io';

class BahanModel {
  String nama;
  DateTime? tanggalKadaluwarsa;
  int jumlah;
  double jumlahSatuan;
  String satuan;
  File? imageFile;
  String? fotoPath;

  BahanModel({
    this.nama = '',
    this.tanggalKadaluwarsa,
    this.jumlah = 0,
    this.jumlahSatuan = 0.0,
    this.satuan = '',
    this.imageFile,
  });
}
