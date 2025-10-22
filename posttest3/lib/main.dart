import 'package:flutter/material.dart';
import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

// Widget root dari aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VivoFive Futsal',
      // Menghilangkan banner debug di pojok kanan atas
      debugShowCheckedModeBanner: false,
      // Mengatur tema aplikasi secara global, termasuk warna primer
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF4CAF50),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // Menentukan halaman awal saat aplikasi dibuka
      initialRoute: '/welcome',
      // Mendefinisikan semua rute bernama yang ada di aplikasi
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}