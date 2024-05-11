import 'package:flutter/material.dart';
import 'login.dart'; // Impor halaman login jika belum

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
        
          IconButton(
            onPressed: () {
              // Fungsi untuk mengakses pengaturan
              // Ganti `SettingsPage()` dengan halaman yang sesuai
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/girl.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Xyraaa',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'xyra@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fungsi logout
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Hapus semua rute sehingga tidak bisa kembali ke halaman profil setelah logout
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}



// Halaman pengaturan
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Center(
        child: Text('Ini adalah halaman pengaturan.'),
      ),
    );
  }
}
