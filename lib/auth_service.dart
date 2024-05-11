import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  final String apiUrl = 'http://146.190.109.66:8000';

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Jika berhasil login, return data user
      return jsonDecode(response.body);
    } else {
      // Jika gagal login, return null
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // Jika berhasil register, return data user
      return jsonDecode(response.body);
    } else {
      // Jika gagal register, return null
      return null;
    }
  }

  Future<Map<String, dynamic>?> getUserData(String userId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/users/$userId'),
    );

    if (response.statusCode == 200) {
      // Jika berhasil mendapatkan data user, return data user
      return jsonDecode(response.body);
    } else {
      // Jika gagal mendapatkan data user, return null
      return null;
    }
  }
}
