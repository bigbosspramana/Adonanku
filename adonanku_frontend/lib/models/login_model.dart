import 'package:adonanku_frontend/models/user_model.dart';

class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class LoginResponseModel {
  final String message;
  final String accessToken;
  final String tokenType;
  final UserModel user;

  LoginResponseModel({
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] ?? '',
      accessToken: json['access_token'] ?? '',
      tokenType: json['token_type'] ?? '',
      user: UserModel.fromJson(json['user']),
    );
  }

}
