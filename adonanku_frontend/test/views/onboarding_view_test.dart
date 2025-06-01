import 'package:adonanku_frontend/views/onboarding1_view.dart';
import 'package:adonanku_frontend/views/onboarding2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  group('OnBoarding Flow', () {
    testWidgets('Halaman onboarding1 muncul dan tombol Mulai bekerja',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Onboarding1View()));
      await tester.pumpAndSettle();

      expect(find.text('Selamat Datang'), findsOneWidget);

      await tester.tap(find.text('Mulai'));
      await tester.pumpAndSettle();

      expect(find.text('Sistem Inventori'), findsOneWidget);
    });

    testWidgets('Navigasi halaman OnBoarding2 berjalan sesuai urutan',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(800, 1600));

      await tester.pumpWidget(
        ProviderScope(
          child: const MaterialApp(home: Onboarding1View()),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text('Mulai'));
      await tester.pumpAndSettle();

      // Index 0
      expect(find.text('Sistem Inventori'), findsOneWidget);
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Index 1
      expect(find.text('Resep Populer'), findsOneWidget);
      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Index 2
      expect(find.text('Konversi Bahan'), findsOneWidget);
      await tester.tap(find.text('Lanjut'));
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsWidgets);
    });

    testWidgets('Smooth Page Indicator OnBoarding2_View',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OnBoarding2Page()));
      await tester.pumpAndSettle();

      // Pastikan indikator ditemukan
      expect(find.byType(SmoothPageIndicator), findsOneWidget);

      // Ambil widget indikator
      final indicator = tester.widget<SmoothPageIndicator>(
        find.byType(SmoothPageIndicator),
      );

      // Cek jumlah dot (halaman)
      expect(indicator.count, 3);
    });
  });
}
