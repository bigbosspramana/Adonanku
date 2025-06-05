import 'dart:io';
import 'package:adonanku_frontend/models/login_model.dart';
import 'package:adonanku_frontend/models/user_model.dart';
import 'package:adonanku_frontend/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/services/auth_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_test.mocks.dart';

@GenerateMocks([AuthService])
void main() {
  setUp(() {
    HttpOverrides.global = null;
  });

  group('Login Test', () {
    testWidgets('Pass Login', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      final passwordField = find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            widget.decoration?.hintText == 'Masukkan password',
      );

      expect(passwordField, findsOneWidget);

      final textFieldWidget = tester.widget<TextField>(passwordField);
      expect(textFieldWidget.obscureText, isTrue);
    });

    testWidgets('Checkbox toggle berhasil menampilkan Icon centang',
        (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      expect(find.byIcon(Icons.check), findsNothing);

      await tester.tap(find.byKey(const Key('customCheckbox')));
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });

    testWidgets('Halaman Login ke Register', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Daftar'), findsOneWidget);
      await tester.pumpAndSettle();
    });

    testWidgets('Login form test with mocked AuthService', (tester) async {
      final mockAuthService = MockAuthService();

      // Correct way to use any for named parameters
      when(mockAuthService.login(
        email: 'contoh@example.com',
        password: 'passwordku123',
      )).thenAnswer((invocation) async {
        // You can access the actual parameters if needed
        final email = invocation.namedArguments[#email] as String;

        return LoginResponseModel(
          message: 'Login successful',
          accessToken: 'token123',
          tokenType: 'Bearer',
          user: User(
            id: 1,
            nama: 'Kevin',
            email: email, // Using the actual email parameter
            username: 'bigboss',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );
      });

      final container = ProviderContainer(
        overrides: [
          authServiceProvider.overrideWithValue(mockAuthService),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(home: LoginPage()),
        ),
      );

      await tester.pumpAndSettle();

      final usernameField = find.byKey(const Key('usernameField'));
      final passwordField = find.byKey(const Key('passField'));
      final loginButton = find.byKey(const Key('loginButton'));

      expect(usernameField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(loginButton, findsOneWidget);

      // Fill fields
      await tester.enterText(usernameField, 'contoh@example.com');
      await tester.enterText(passwordField, 'passwordku123');

      await tester.ensureVisible(find.byKey(const Key('customCheckbox')));
      await tester.tap(find.byKey(const Key('customCheckbox')));
      await tester.pumpAndSettle();

      // Tap login button
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify the mock was called
      verify(mockAuthService.login(
        email: 'contoh@example.com',
        password: 'passwordku123',
      )).called(1);
    });
  });
}
