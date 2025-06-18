import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adonanku_frontend/models/login_model.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel, http.Client client) async {
    final url = Uri.parse('http://172.20.10.3:8000/api/login');

    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestModel.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return LoginResponseModel.fromJson(data);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['message'] ?? 'Login gagal');
    }
  }
}
