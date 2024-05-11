import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'YOUR_AUTH_API_URL';

  Future<String?> authenticateUser(int userId) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'userId': userId.toString()},
      );

      if (response.statusCode == 200) {
        // Jika autentikasi berhasil, simpan token
        final token = response.body;
        await saveToken(token);
        return null;
      } else {
        // Jika autentikasi gagal, kembalikan pesan kesalahan
        return 'Autentikasi gagal';
      }
    } catch (e) {
      return 'Terjadi kesalahan: $e';
    }
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

class ProfilePage extends StatelessWidget {
  final int userId;
  final AuthService authService = AuthService();

  ProfilePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final error = await authService.authenticateUser(userId);
            if (error != null) {
              // Tampilkan pesan kesalahan jika autentikasi gagal
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error),
                ),
              );
            } else {
              // Pindah ke halaman utama setelah autentikasi berhasil
              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: Text('Autentikasi dengan ID $userId'),
        ),
      ),
    );
  }
}