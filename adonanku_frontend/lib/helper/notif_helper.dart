class NotifCardModel {
  final String judulNotif;
  final String deskNotif;      

  NotifCardModel({
    required this.judulNotif,
    required this.deskNotif,
    // required this.img,
  });
}

final List<NotifCardModel> notifList = [
  NotifCardModel(
    judulNotif: 'Stok Terigu anda Hampir Habis',
    deskNotif: 'Segera lakukan pembelian ulang sebelum kehabisan.',
  ),
  NotifCardModel(
    judulNotif: 'Stok Gula Tinggal Sedikit',
    deskNotif: 'Sisa 1 kg, periksa kebutuhan untuk besok.',
  ),
  NotifCardModel(
    judulNotif: 'Pesanan Baru Masuk',
    deskNotif: 'Cek pesanan dari pelanggan: Roti Tawar 10 pcs.',
  ),
  NotifCardModel(
    judulNotif: 'Bahan Coklat Hampir Kadaluarsa',
    deskNotif: 'Tanggal kedaluwarsa: 20 Juni 2025.',
  ),
  NotifCardModel(
    judulNotif: 'Koneksi Internet Tidak Stabil',
    deskNotif: 'Beberapa data gagal tersimpan, coba lagi nanti.',
  ),
  NotifCardModel(
    judulNotif: 'Pesanan Baru Masuk',
    deskNotif: 'Cek pesanan dari pelanggan: Roti Tawar 10 pcs.',
  ),
  NotifCardModel(
    judulNotif: 'Bahan Coklat Hampir Kadaluarsa',
    deskNotif: 'Tanggal kedaluwarsa: 20 Juni 2025.',
  ),
  NotifCardModel(
    judulNotif: 'Koneksi Internet Tidak Stabil',
    deskNotif: 'Beberapa data gagal tersimpan, coba lagi nanti.',
  ),
];