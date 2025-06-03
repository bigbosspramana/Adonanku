import 'package:adonanku_frontend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Jumlah awal adalah 0', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TambahBahanApp())),
    );

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Tombol + menambah jumlah', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TambahBahanApp())),
    );

    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Tombol - mengurangi jumlah', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TambahBahanApp())),
    );

    // tambah 2 dulu
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.tap(find.byKey(const Key('incrementButton')));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    // kurangi 1
    await tester.tap(find.byKey(const Key('decrementButton')));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Input manual jumlah via TextField', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MaterialApp(home: TambahBahanApp())),
    );

    await tester.enterText(find.byKey(const Key('jumlahField')), '99');
    await tester.pump();

    expect(find.text('99'), findsOneWidget);
  });
}
