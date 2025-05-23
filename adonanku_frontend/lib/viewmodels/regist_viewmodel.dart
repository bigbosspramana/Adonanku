import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<String?> register() async {
    final url = Uri.parse('http://172.20.10.3:8000/api/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nama': nameController.text.trim(),
          'username': usernameController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'password_confirmation': passwordConfirmationController.text.trim(),
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null; // sukses
      } else {
        final error = jsonDecode(response.body);
        if (error['message'] != null) {
          return error['message'];
        } else if (error['errors'] != null) {
          return error['errors'].values.first[0];
        } else {
          return 'Terjadi kesalahan';
        }
      }
    } catch (e) {
      return 'Gagal koneksi ke server: $e';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }
}
