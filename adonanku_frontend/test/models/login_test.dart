import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:adonanku_frontend/models/login_model.dart';
import 'package:adonanku_frontend/services/login_service.dart';

import 'login_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('LoginService', () {
    test('returns LoginResponseModel if login is successful', () async {
      final client = MockClient();
      final service = LoginService();

      final request = LoginRequestModel(email: 'test@gmail.com', password: 'password123');

      final mockResponse = {
        "message": "Login berhasil",
        "access_token": "token123",
        "token_type": "Bearer",
        "user": {
          "id": 1,
          "nama": "Test",
          "email": "test@gmail.com",
          "username": "tester",
          "created_at": "2025-05-27T00:00:00.000Z",
          "updated_at": "2025-05-27T00:00:00.000Z"
        }
      };

      when(client.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final response = await service.login(request, client);

      expect(response.message, 'Login berhasil');
      expect(response.accessToken, 'token123');
      expect(response.user.email, 'test@gmail.com');
    });

    test('throws Exception when login fails', () async {
      final client = MockClient();
      final service = LoginService();

      final request = LoginRequestModel(email: 'wrong@gmail.com', password: 'wrongpass');

      final errorResponse = {
        "message": "Email atau password salah"
      };

      when(client.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(errorResponse), 401));

      expect(
        () async => await service.login(request, client),
        throwsA(predicate((e) => e is Exception && e.toString().contains('Email atau password salah'))),
      );
    });
  });
}
