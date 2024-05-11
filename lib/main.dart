import 'package:flutter/material.dart';
import 'login.dart';
import 'home_screen.dart';
import 'register.dart';
import 'cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        'register': (context) =>RegisterPage()
      },
    );
  }
}
