import 'package:flutter/material.dart';

class BahanCardModel {
  final String namaBahan;
  final String satuanBahan;      
  final double jumlahSatuanBahan;     
  final String jenisSatuanBahan;       
  final double jumlahBahan;     
  final DateTime expireDate;     
  // final Widget img;  

  BahanCardModel({
    required this.namaBahan,
    required this.satuanBahan,
    required this.jumlahSatuanBahan,
    required this.jenisSatuanBahan,
    required this.jumlahBahan,
    required this.expireDate,
    // required this.img,
  });
}

final List<BahanCardModel> bahanList = [
  BahanCardModel(
    namaBahan: 'Tepung Terigu',
    satuanBahan: 'kg',
    jumlahSatuanBahan: 2,
    jenisSatuanBahan: 'bks',
    jumlahBahan: 2.0,
    expireDate: DateTime(2025, 5, 10),
    // img: 'assets/images/tepung.png',
  ),
  BahanCardModel(
    namaBahan: 'Gula Pasir',
    satuanBahan: 'kg',
    jumlahSatuanBahan: 1,
    jenisSatuanBahan: 'bks',
    jumlahBahan: 1.0,
    expireDate: DateTime(2025, 6, 20),
    // img: 'assets/images/gula.png',
  ),
  BahanCardModel(
    namaBahan: 'Susu Cair',
    satuanBahan: 'liter',
    jumlahSatuanBahan: 1.5,
    jenisSatuanBahan: 'bks',
    jumlahBahan: 1.5,
    expireDate: DateTime(2025, 5, 25),
    // img: 'assets/images/susu.png',
  ),
  BahanCardModel(
    namaBahan: 'Mentega',
    satuanBahan: 'gr',
    jumlahSatuanBahan: 200,
    jenisSatuanBahan: 'bks',
    jumlahBahan: 0.2,
    expireDate: DateTime(2025, 4, 30),
    // img: 'assets/images/mentega.png',
  ),
  BahanCardModel(
    namaBahan: 'Coklat Bubuk',
    satuanBahan: 'gr',
    jumlahSatuanBahan: 100,
    jenisSatuanBahan: 'bks',
    jumlahBahan: 0.1,
    expireDate: DateTime(2025, 7, 1),
    // img: 'assets/images/coklat.png',
  ),
];
