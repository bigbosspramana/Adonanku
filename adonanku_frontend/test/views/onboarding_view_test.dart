import 'package:adonanku_frontend/views/onboarding1_view.dart';
import 'package:adonanku_frontend/views/onboarding2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

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
      final controller = PageController();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: OnBoarding2Page(externalController: controller),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Halaman pertama
      expect(find.text('Sistem Inventori'), findsOneWidget);
      expect(controller.page?.round(), 0);

      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Halaman kedua
      expect(find.text('Resep Populer'), findsOneWidget);
      expect(controller.page?.round(), 1);

      await tester.tap(find.text('Skip'));
      await tester.pumpAndSettle();

      // Halaman ketiga
      expect(find.text('Konversi Bahan'), findsOneWidget);
      expect(controller.page?.round(), 2);

      await tester.tap(find.text('Lanjut'));
      await tester.pumpAndSettle();

      // Halaman Login
      expect(find.text('Login'), findsWidgets);
      expect(find.text('Anda belum'), findsWidgets);
      expect(find.text('Memiliki'), findsWidgets);
      expect(find.text('Akun?'), findsWidgets);
    });
  });
}
