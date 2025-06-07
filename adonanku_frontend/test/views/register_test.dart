import 'package:adonanku_frontend/models/regist_model.dart';
import 'package:adonanku_frontend/providers/regist_provider.dart';
import 'package:adonanku_frontend/viewmodels/regist_viewmodel.dart';
import 'package:adonanku_frontend/views/regist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../services/test_helper.mocks.dart';

void main() {
  late MockAuthService mockAuthService;
  late RegisterViewModel viewModel;

  setUp(() {
    mockAuthService = MockAuthService();
    viewModel = RegisterViewModel(authService: mockAuthService);
  });

  testWidgets('RegisterPage widget test with mock',
      (WidgetTester tester) async {
    final fakeRegisterResponse = RegisterModel(
      message: 'Registrasi berhasil',
      user: RegisterUser(
        id: 1,
        nama: 'Kevin',
        username: 'alvinyuga',
        email: 'alvin@example.com',
        password: 'password123',
        confirmPassword: 'password123',
        createdAt: DateTime.now().toIso8601String(),
      ),
    );

    when(mockAuthService.register(
      nama: anyNamed('nama'),
      username: anyNamed('username'),
      email: anyNamed('email'),
      password: anyNamed('password'),
      passwordConfirmation: anyNamed('passwordConfirmation'),
    )).thenAnswer((_) async => fakeRegisterResponse);

    // Build widget
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          registerViewModelProvider.overrideWith((ref) => viewModel),
        ],
        child: const MaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(Key('namaLengkap_field')), findsOneWidget);
    expect(find.byKey(Key('username_field')), findsOneWidget);
    expect(find.byKey(Key('email_field')), findsOneWidget);
    expect(find.byKey(Key('password_field')), findsOneWidget);
    expect(find.byKey(Key('conpassword_field')), findsOneWidget);

    await tester.enterText(find.byKey(Key('namaLengkap_field')), 'Alvin Yuga');
    await tester.enterText(find.byKey(Key('username_field')), 'alvinyuga');
    await tester.enterText(find.byKey(Key('email_field')), 'alvin@example.com');
    await tester.enterText(find.byKey(Key('password_field')), 'password123');
    await tester.enterText(find.byKey(Key('conpassword_field')), 'password123');

    await tester.ensureVisible(find.byKey(const Key('customCheckbox')));
    await tester.tap(find.byKey(const Key('customCheckbox')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pumpAndSettle();
  });

  testWidgets('Input Password Hide', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    final passwordField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.hintText == 'Masukkan password',
    );

    final conpasswordField = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.hintText == 'Konfirmasi password',
    );

    expect(passwordField, findsOneWidget);
    expect(conpasswordField, findsOneWidget);

    final passFieldWidget = tester.widget<TextField>(passwordField);
    final conpassFieldWidget = tester.widget<TextField>(conpasswordField);
    expect(passFieldWidget.obscureText, isTrue);
    expect(conpassFieldWidget.obscureText, isTrue);
  });

  testWidgets('Input Password Hide', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: RegisterPage(),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
  });
}
