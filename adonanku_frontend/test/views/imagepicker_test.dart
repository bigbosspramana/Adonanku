import 'package:adonanku_frontend/main.dart';
import 'package:adonanku_frontend/providers/bahan_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:adonanku_frontend/viewmodels/bahan_viewmodel.dart';
import '../mocks/image_picker_mock.mocks.dart';

void main() {
  testWidgets('Memilih gambar akan menampilkan gambar di UI',
      (WidgetTester tester) async {
    // Siapkan mock
    final mockPicker = MockImagePicker();

    // Buat dummy file path
    final fakePath = '/fake/path/to/image.jpg';

    // Set mock untuk mengembalikan XFile
    when(mockPicker.pickImage(source: ImageSource.gallery))
        .thenAnswer((_) async => XFile(fakePath));

    // Buat BahanViewModel dengan mock picker
    final testViewModel = BahanViewModel(picker: mockPicker);

    // Pump widget dengan override provider
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          bahanViewModelProvider.overrideWith((ref) => testViewModel),
        ],
        child: const MaterialApp(home: TambahBahanApp()),
      ),
    );

    // Tap area foto (GestureDetector)
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pumpAndSettle();

    // Harusnya fotoPath sekarang diset dan UI berubah menampilkan gambar
    expect(testViewModel.bahan.fotoPath, equals(fakePath));
    expect(find.byType(Image), findsWidgets); // Cek bahwa Image ditampilkan
  });
}
