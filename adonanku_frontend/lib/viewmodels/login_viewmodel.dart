import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// ViewModel
class LoginViewModel extends AsyncNotifier<String?> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    state = const AsyncValue.data(null);
  }

  bool validate() {
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isChecked;
  }

  Future<bool> login() async {
    if (!validate()) {
      state = const AsyncValue.data("Form belum lengkap atau checkbox belum dicentang");
      return false;
    }

    state = const AsyncLoading();

    final url = Uri.parse('http://172.20.10.3:8000/api/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );

      if (response.statusCode == 200) {
        state = const AsyncValue.data(null);
        return true;
      } else {
        final error = jsonDecode(response.body);
        state = AsyncValue.data(error['message'] ?? 'Login gagal');
        return false;
      }
    } catch (e) {
      state = const AsyncValue.data("Gagal terhubung ke server");
      return false;
    }
  }

  @override
  Future<String?> build() async {
    ref.onDispose(() {
      usernameController.dispose();
      passwordController.dispose();
    });

    return null;
  }
}
