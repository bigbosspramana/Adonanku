import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adonanku_frontend/services/auth_service.dart';

final loginViewModelProvider =
    AsyncNotifierProvider<LoginViewModel, String?>(() => LoginViewModel());

class LoginViewModel extends AsyncNotifier<String?> {
  late final AuthService _authService;

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

    try {
      final loginResponse = await _authService.login(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      state = const AsyncValue.data(null);
      return true;
    } catch (e) {
      state = AsyncValue.data(e.toString().replaceFirst('Exception: ', ''));
      return false;
    }
  }

  @override
  Future<String?> build() async {
    _authService = ref.read(authServiceProvider); // Di sini kamu ambil instance-nya
    ref.onDispose(() {
      usernameController.dispose();
      passwordController.dispose();
    });
    return null;
  }
}


// class LoginViewModel extends AsyncNotifier<String?> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();

//   final _authService = AuthService(); 

//   bool isChecked = false;

//   void toggleCheckbox() {
//     isChecked = !isChecked;
//     state = const AsyncValue.data(null);
//   }

//   bool validate() {
//     return usernameController.text.isNotEmpty &&
//         passwordController.text.isNotEmpty &&
//         isChecked;
//   }

//   Future<bool> login() async {
//     if (!validate()) {
//       state = const AsyncValue.data("Form belum lengkap atau checkbox belum dicentang");
//       return false;
//     }

//     state = const AsyncLoading();

//     final email = usernameController.text.trim();
//     final password = passwordController.text.trim();

//     try {
//       final loginResponse = await _authService.login(
//         email: email,
//         password: password,
//       );

//       final token = loginResponse?.accessToken ?? '';
//       print('Token: $token');

//       state = const AsyncValue.data(null);
//       return true;
//     } catch (e) {
//       state = AsyncValue.data(e.toString().replaceFirst('Exception: ', ''));
//       return false;
//     }
//   }

//   @override
//   Future<String?> build() async {
//     ref.onDispose(() {
//       usernameController.dispose();
//       passwordController.dispose();
//     });
//     return null;
//   }
// }
