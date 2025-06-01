import 'package:adonanku_frontend/services/auth_service.dart';
import 'package:adonanku_frontend/models/regist_model.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final AuthService _authService = AuthService();

  bool isChecked = false;
  String? errorMessage;
  RegisterModel? registerResult;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  Future<String?> register() async {
    try {
      registerResult = await _authService.register(
        nama: nameController.text.trim(),
        username: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        passwordConfirmation: passwordConfirmationController.text.trim(),
      );
      errorMessage = null;
      return errorMessage;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      registerResult = null;
      return null;
    } finally {
      notifyListeners(); 
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
