import 'dart:io';
import 'package:adonanku_frontend/providers/bahan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // <-- Tambahkan ini

class TambahBahanPage extends ConsumerWidget {
  final List<String> satuanList = ["Kilogram (kg)", "Gram (g)", "Liter (l)"];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(bahanViewModelProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F6B5C),
        elevation: 0,
        title: Text(
          'Tambah Bahan',
          style: GoogleFonts.radioCanada(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Foto bahan
                  Center(
                    child: GestureDetector(
                      onTap: vm.pickImage,
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              image: vm.bahan.fotoPath != null
                                  ? DecorationImage(
                                      image:
                                          FileImage(File(vm.bahan.fotoPath!)),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            child: vm.bahan.fotoPath == null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.camera_alt, size: 32),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Unggah Foto\nBahan',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.radioCanada(),
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFD18632),
                              radius: 16,
                              child: const Icon(Icons.edit,
                                  size: 16, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    'Detail Bahan',
                    style: GoogleFonts.radioCanada(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Nama Bahan
                  _buildInputField(
                    label: 'Nama',
                    hint: 'Masukkan nama bahan',
                    onChanged: vm.setNama,
                  ),
                  const SizedBox(height: 16),

                  /// Tanggal & Jumlah
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) vm.setTanggal(picked);
                          },
                          child: AbsorbPointer(
                            child: _buildInputField(
                              label: 'Tanggal Kadaluwarsa',
                              hint: vm.bahan.tanggalKadaluwarsa == null
                                  ? 'Masukkan tanggal'
                                  : "${vm.bahan.tanggalKadaluwarsa!.toLocal()}"
                                      .split(' ')[0],
                              icon: Icons.calendar_month,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jumlah', style: GoogleFonts.radioCanada()),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  key: const Key('decrementButton'),
                                  icon: const Icon(Icons.remove),
                                  onPressed: vm.decrementJumlah,
                                ),
                                SizedBox(
                                  width: 40,
                                  child: TextField(
                                    key: const Key('jumlahField'),
                                    controller: vm.jumlahController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    onChanged: vm.setJumlah,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  key: const Key('incrementButton'),
                                  icon: const Icon(Icons.add),
                                  onPressed: vm.incrementJumlah,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Jumlah Satuan & Satuan
                  Row(
                    children: [
                      Expanded(
                        child: _buildInputField(
                          label: 'Jumlah Satuan',
                          hint: 'Masukkan Jumlah',
                          onChanged: vm.setJumlahSatuan,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Satuan', style: GoogleFonts.radioCanada()),
                            const SizedBox(height: 8),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: satuanList.contains(vm.bahan.satuan)
                                      ? vm.bahan.satuan
                                      : null,
                                  items: satuanList.map((satuan) {
                                    return DropdownMenuItem(
                                      value: satuan,
                                      child: Text(satuan),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) vm.setSatuan(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Tombol Tambah
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: vm.simpanData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD18632),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                ),
                child: Text(
                  'Tambah',
                  style: GoogleFonts.radioCanada(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    IconData? icon,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    List<TextInputFormatter>? inputFormatters, // <-- Tambahkan ini
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.radioCanada()),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          inputFormatters: inputFormatters, // <-- Terapkan di sini
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon) : null,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}
