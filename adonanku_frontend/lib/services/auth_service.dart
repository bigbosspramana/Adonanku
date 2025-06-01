import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adonanku_frontend/models/regist_model.dart';
import 'package:adonanku_frontend/models/login_model.dart';

class AuthService {
  Future<RegisterModel?> register({
    required String nama,
    required String username,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final url = Uri.parse('http://172.20.10.3:8000/api/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nama': nama,
          'username': username,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return RegisterModel.fromJson(data);
      } else {
        throw Exception(_parseErrorMessage(response.body));
      }
    } catch (e) {
      throw Exception('Gagal koneksi ke server: $e');
    }
  }

  Future<LoginResponseModel?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('http://172.20.10.3:8000/api/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponseModel.fromJson(data);
      } else {
        throw Exception(_parseErrorMessage(response.body));
      }
    } catch (e) {
      throw Exception('Gagal koneksi ke server: $e');
    }
  }

  String _parseErrorMessage(String body) {
    final error = jsonDecode(body);
    if (error['message'] != null) {
      return error['message'];
    } else if (error['errors'] != null) {
      return error['errors'].values.first[0];
    } else {
      return 'Terjadi kesalahan';
    }
  }
}
