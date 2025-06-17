import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../viewmodels/bahan_viewmodel.dart';

class BahanImagePicker extends ConsumerWidget {
  const BahanImagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePath = ref.watch(bahanViewModelProvider).imagePath;
    final viewModel = ref.read(bahanViewModelProvider.notifier);

    return Center(
      // Tambahkan agar container tetap di tengah
      child: GestureDetector(
        onTap: viewModel.pickImage,
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.4, // Ubah lebar
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.grey[200],
            borderRadius:
                BorderRadius.circular(16), // Tambahkan sudut melengkung
          ),
          child: (imagePath.isEmpty)
              ? const Center(
                  child: Text(
                    "Pilih Foto",
                    style: TextStyle(
                      fontFamily: 'Radio Canada', // jika font sudah tersedia
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius:
                      BorderRadius.circular(16), // Clip image agar ikut radius
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
        ),
      ),
    );
  }
}
