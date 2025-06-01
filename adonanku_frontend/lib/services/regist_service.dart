import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/regist_model.dart';

class RegisterService {
  Future<RegisterModel> register(Map<String, dynamic> data, http.Client client) async {
    final response = await client.post(
      Uri.parse('http://192.168.1.12:8000/api/register'), // ini nanti diganti saat backend ready
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return RegisterModel.fromJson(json);
    } else {
      final json = jsonDecode(response.body);
      throw Exception(json['message'] ?? 'Gagal mendaftar');
    }
  }
}
