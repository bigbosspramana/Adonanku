class ResepCardModel {
  final String namaResep;
  final String waktuResep;
  final String jenisResep;
  final String jenisIconResep;
  // final Widget img;

  ResepCardModel({
    required this.namaResep,
    required this.waktuResep,
    required this.jenisResep,
    required this.jenisIconResep,
    // required this.img,
  });
}

final List<ResepCardModel> resepList = [
  ResepCardModel(
    namaResep: 'Bolu Kukus',
    waktuResep: '40',
    jenisResep: 'Kue Kukus',
    jenisIconResep: 'assets/img/kukusr.png',
  ),
  ResepCardModel(
    namaResep: 'Nastar',
    waktuResep: '40',
    jenisResep: 'Kue Kering',
    jenisIconResep: 'assets/img/keringr.png',
  ),
  ResepCardModel(
    namaResep: 'Pudding',
    waktuResep: '40',
    jenisResep: 'Kue Basah',
    jenisIconResep: 'assets/img/basahr.png',
  ),
];
