import 'package:adonanku_frontend/viewmodels/bahan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:adonanku_frontend/views/bahan/widgets/bahan_form_field.dart';
import 'package:adonanku_frontend/views/bahan/widgets/bahan_image_picker.dart';
import 'package:adonanku_frontend/views/bahan/widgets/jumlah_counter.dart';

class BahanFormPage extends ConsumerWidget {
  final bool isEdit;

  const BahanFormPage({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bahanViewModel = ref.watch(bahanViewModelProvider);
    final controller = ref.read(bahanViewModelProvider.notifier);

    const labelStyle = TextStyle(
      fontFamily: 'Radio Canada',
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C6758),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          isEdit ? 'Edit Bahan' : 'Tambah Bahan',
          style: const TextStyle(
            fontFamily: 'Radio Canada',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey, // warna garis tepi
                  width: 1, // ketebalan garis tepi
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BahanImagePicker(),
                  const SizedBox(height: 24),
                  const Text(
                    "Detail Bahan",
                    style: TextStyle(
                      fontFamily: 'Radio Canada',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nama Bahan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nama", style: labelStyle),
                      const SizedBox(height: 8),
                      BahanFormField(
                        hintText: "Masukkan nama bahan",
                        controller: controller.namaController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tanggal & Jumlah
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Tanggal Kadaluwarsa",
                                style: labelStyle),
                            const SizedBox(height: 8),
                            BahanFormField(
                              hintText: "Masukkan tanggal",
                              prefixIcon: Icons.calendar_month_outlined,
                              readOnly: true,
                              controller: controller.tanggalController,
                              onTap: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) {
                                  controller.tanggalController.text =
                                      DateFormat('d MMMM yyyy').format(picked);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Jumlah", style: labelStyle),
                            const SizedBox(height: 8),
                            JumlahCounter(jumlah: bahanViewModel.jumlah),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Jumlah Satuan & Satuan
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Jumlah Bahan", style: labelStyle),
                            const SizedBox(height: 8),
                            BahanFormField(
                              hintText: "Masukkan Jumlah",
                              controller: controller.jumlahSatuanController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Satuan", style: labelStyle),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: controller.selectedSatuan,
                              icon: const Icon(Icons.expand_more),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFF1F1F1),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD1D1D1)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD1D1D1)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD1D1D1)),
                                ),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Radio Canada',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              items: controller.satuanOptions
                                  .map((satuan) => DropdownMenuItem(
                                        value: satuan,
                                        child: Text(satuan),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedSatuan = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Tambah / Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint(
                      "Data bahan disimpan: ${controller.namaController.text}, jumlah: ${bahanViewModel.jumlah}");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFCD8329),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                ),
                child: Text(
                  isEdit ? "Simpan" : "Tambah",
                  style: const TextStyle(
                    fontFamily: 'Radio Canada',
                    fontSize: 16,
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
}
