import 'package:adonanku_frontend/models/regist_model.dart';
import 'package:adonanku_frontend/models/login_model.dart';

abstract class AuthService {
  Future<RegisterModel?> register({
    required String nama,
    required String username,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<LoginResponseModel?> login({
    required String email,
    required String password,
  });
}
