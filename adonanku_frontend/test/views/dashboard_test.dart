import 'package:adonanku_frontend/views/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dashboard Flow', () {
    testWidgets('Dashboard Page to Inventori Page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
      await tester.pumpAndSettle();

      expect(find.text('Selamat Datang, Kevin'), findsOneWidget);

      expect(find.text('Kategori'), findsOneWidget);

      final inventoriButton = find.byKey(const Key('inventori'));

      expect(inventoriButton, findsOneWidget);

      await tester.pumpAndSettle();

    });

    testWidgets('Dashboard Page to Resep Page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
      await tester.pumpAndSettle();

      expect(find.text('Selamat Datang, Kevin'), findsOneWidget);

      expect(find.text('Kategori'), findsOneWidget);

      final resepButton = find.byKey(const Key('resep'));

      expect(resepButton, findsOneWidget);

      await tester.pumpAndSettle();

    });

    testWidgets('Dashboard Page to Konversi Page',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: DashboardPage()));
      await tester.pumpAndSettle();

      expect(find.text('Selamat Datang, Kevin'), findsOneWidget);

      expect(find.text('Kategori'), findsOneWidget);

      final konversiButton = find.byKey(const Key('konversi'));

      expect(konversiButton, findsOneWidget);

      await tester.pumpAndSettle();

    });
  });

  group('Dashboard data render', () {

  });
}
