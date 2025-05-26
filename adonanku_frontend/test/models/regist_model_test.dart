import 'package:flutter_test/flutter_test.dart';
import 'package:adonanku_frontend/models/registresponse_model.dart';

void main() {
  test('RegisterResponseModel fromJson parses correctly', () {
    final json = {
      "message": "Register berhasil",
      "user": {
        "id": 13,
        "nama": "alvin",
        "username": "bigboss",
        "email": "alvin123@gmail.com",
        "created_at": "2025-05-22T03:33:05.000000Z"
      }
    };

    final model = RegisterResponseModel.fromJson(json);

    expect(model.message, "Register berhasil");
    expect(model.user.id, 13);
    expect(model.user.nama, "alvin");
    expect(model.user.username, "bigboss");
    expect(model.user.email, "alvin123@gmail.com");
    expect(model.user.createdAt, "2025-05-22T03:33:05.000000Z");
  });
}
