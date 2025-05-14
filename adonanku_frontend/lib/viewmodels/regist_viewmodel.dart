import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/user_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  bool get isFormValid =>
      usernameController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      isChecked;

  UserModel get user => UserModel(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
