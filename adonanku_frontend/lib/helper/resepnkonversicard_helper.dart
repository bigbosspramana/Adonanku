class ResepnKonversiCardModel {
  final String namaResep;
  final String waktuResep;
  final String jenisResep;
  final String jenisIconResep;
  // final Widget img;

  ResepnKonversiCardModel({
    required this.namaResep,
    required this.waktuResep,
    required this.jenisResep,
    required this.jenisIconResep,
    // required this.img,
  });
}

final List<ResepnKonversiCardModel> resepList = [
  ResepnKonversiCardModel(
    namaResep: 'Bolu Kukus',
    waktuResep: '40',
    jenisResep: 'Kue Kukus',
    jenisIconResep: 'assets/img/kukusr.png',
  ),
  ResepnKonversiCardModel(
    namaResep: 'Nastar',
    waktuResep: '40',
    jenisResep: 'Kue Kering',
    jenisIconResep: 'assets/img/keringr.png',
  ),
  ResepnKonversiCardModel(
    namaResep: 'Pudding',
    waktuResep: '40',
    jenisResep: 'Kue Basah',
    jenisIconResep: 'assets/img/basahr.png',
  ),
];

final List<ResepnKonversiCardModel> konversiList = [
  ResepnKonversiCardModel(
    namaResep: '100 Bolu Kukus',
    waktuResep: '40',
    jenisResep: 'Kue Kukus',
    jenisIconResep: 'assets/img/kukusr.png',
  ),
  ResepnKonversiCardModel(
    namaResep: '100 Nastar',
    waktuResep: '40',
    jenisResep: 'Kue Kering',
    jenisIconResep: 'assets/img/keringr.png',
  ),
  ResepnKonversiCardModel(
    namaResep: '100 Pudding',
    waktuResep: '40',
    jenisResep: 'Kue Basah',
    jenisIconResep: 'assets/img/basahr.png',
  ),
];
