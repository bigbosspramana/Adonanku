import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:adonanku_frontend/services/regist_service.dart';

import 'regist_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('RegisterService', () {
    test('returns RegisterModel when registration is successful', () async {
      final client = MockClient();
      final service = RegisterService();

      final mockRequest = {
        "nama": "Alvin Yuga",
        "username": "alvinyuga",
        "email": "alvin@example.com",
        "password": "password123",
        "confirm_password": "password123"
      };

      final mockResponse = {
        "message": "Registrasi berhasil",
        "user": {
          "id": 1,
          "nama": "Alvin Yuga",
          "username": "alvinyuga",
          "email": "alvin@example.com",
          "password": "password123",
          "confirm_password": "password123",
          "created_at": "2025-05-27T00:00:00.000Z"
        }
      };

      when(client.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await service.register(mockRequest, client);

      expect(result.message, 'Registrasi berhasil');
      expect(result.user.nama, 'Alvin Yuga');
    });

    test('throws Exception when registration fails', () async {
      final client = MockClient();
      final service = RegisterService();

      final mockRequest = {
        "nama": "Alvin Yuga",
        "username": "alvinyuga",
        "email": "alvin@example.com",
        "password": "password123",
        "confirm_password": "wrong"
      };

      final mockError = {
        "message": "Konfirmasi password tidak sesuai"
      };

      when(client.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockError), 400));

      expect(
        () async => await service.register(mockRequest, client),
        throwsA(predicate((e) =>
            e is Exception &&
            e.toString().contains("Konfirmasi password tidak sesuai"))),
      );
    });
  });
}
