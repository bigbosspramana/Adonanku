import 'package:test/test.dart';
import 'package:adonanku_frontend/models/loginresponse_model.dart';

void main() {
  test('LoginResponseModel fromJson parses correctly', () {
    final json = {
      "message": "Login berhasil",
      "access_token": "6|Axo2eKb0adg3zTUi71ADhhMNTZNMitrhJHqKRoBab03a33ad",
      "token_type": "Bearer",
      "user": {
        "id": 12,
        "nama": "alvin",
        "email": "alvin123@gmail.com",
        "username": "bigboss",
        "created_at": "2025-05-22T03:33:05.000000Z",
        "updated_at": "2025-05-22T03:33:05.000000Z"
      }
    };

    final model = LoginResponseModel.fromJson(json);

    expect(model.message, 'Login berhasil');
    expect(model.accessToken, isNotEmpty);
    expect(model.tokenType, 'Bearer');

    expect(model.user.id, 12);
    expect(model.user.nama, 'alvin');
    expect(model.user.email, 'alvin123@gmail.com');
    expect(model.user.username, 'bigboss');
    expect(model.user.createdAt, DateTime.parse('2025-05-22T03:33:05.000000Z'));
    expect(model.user.updatedAt, DateTime.parse('2025-05-22T03:33:05.000000Z'));
  });
}
