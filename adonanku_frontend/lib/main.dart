import 'package:adonanku_frontend/views/onboarding1_view.dart';
import 'package:adonanku_frontend/views/tambahbahan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: TambahBahanApp()));
}

class TambahBahanApp extends StatelessWidget {
  const TambahBahanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
        fontFamily: 'RadioCanada',
      ),
      debugShowCheckedModeBanner: false,
      home: TambahBahanPage(), // Ganti dengan halaman Tambah Bahan
    );
  }
}

class Onboarding1App extends StatelessWidget {
  const Onboarding1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
        fontFamily: 'RadioCanada',
      ),
      home: const Onboarding1View(),
      debugShowCheckedModeBanner: false,
    );
  }
}
