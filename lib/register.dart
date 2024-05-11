import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    // Buat body request sesuai dengan struktur yang dibutuhkan oleh API
    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };

    // Buat permintaan HTTP POST ke endpoint register
    final response = await http.post(
      Uri.parse('http://146.190.109.66:8000/users/'), // Ganti dengan alamat API register Anda
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // Jika respons sukses, tampilkan pesan sukses dan kembali ke halaman login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registrasi berhasil. Silakan login.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.greenAccent,
        ),
      );
      Navigator.pop(context); // Kembali ke halaman login setelah registrasi sukses
    } else {
      // Jika respons gagal, tampilkan pesan kesalahan kepada pengguna
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registrasi gagal. Silakan coba lagi.',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.greenAccent // Warna latar belakang appbar
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.grey[200], // Warna latar belakang field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey[200], // Warna latar belakang field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => register(context), // Panggil fungsi register saat tombol ditekan
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.greenAccent, // Warna teks pada tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}