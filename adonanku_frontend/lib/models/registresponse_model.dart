class RegisterResponseModel {
  final String message;
  final RegisterUser user;

  RegisterResponseModel({
    required this.message,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
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
  final String createdAt;

  RegisterUser({
    required this.id,
    required this.nama,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      createdAt: json['created_at'],
    );
  }
}
