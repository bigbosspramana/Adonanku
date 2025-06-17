import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/bahan/bahan_form_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tes Tambah/Edit Bahan',
      theme: ThemeData(
        fontFamily: 'Radio Canada', // <- gunakan ini, bukan 'RadioCanada'
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF14635D)),
      ),
      home: const BahanFormPage(
        isEdit: false,
        key: null,
      ),
    );
  }
}
