import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  UserModel get user => UserModel(
        username: usernameController.text,
        password: passwordController.text,
      );

  bool validate() {
    return user.username.isNotEmpty && user.password.isNotEmpty && isChecked;
  }

  void disposeControllers() {
    usernameController.dispose();
    passwordController.dispose();
  }
}
