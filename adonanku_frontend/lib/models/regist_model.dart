class RegisterModel {
  final String message;
  final RegisterUser user;

  RegisterModel({
    required this.message,
    required this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'] ?? '',
      user: RegisterUser.fromJson(json['user']),
    );
  }
}

class RegisterUser {
  final int id;
  final String nama;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String createdAt;

  RegisterUser({
    required this.id,
    required this.nama,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.createdAt,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirm_password'],
      createdAt: json['created_at'],
    );
  }
}
