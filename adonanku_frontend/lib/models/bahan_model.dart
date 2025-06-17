class BahanModel {
  String nama;
  int jumlah;
  String satuan;
  DateTime tanggalKadaluwarsa;
  double jumlahSatuan;
  String imagePath;

  BahanModel({
    required this.nama,
    required this.jumlah,
    required this.satuan,
    required this.tanggalKadaluwarsa,
    this.jumlahSatuan = 0.0,
    this.imagePath = '',
  });

  BahanModel copyWith({
    String? nama,
    int? jumlah,
    String? satuan,
    DateTime? tanggalKadaluwarsa,
    double? jumlahSatuan,
    String? imagePath,
  }) {
    return BahanModel(
      nama: nama ?? this.nama,
      jumlah: jumlah ?? this.jumlah,
      satuan: satuan ?? this.satuan,
      tanggalKadaluwarsa: tanggalKadaluwarsa ?? this.tanggalKadaluwarsa,
      jumlahSatuan: jumlahSatuan ?? this.jumlahSatuan,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
