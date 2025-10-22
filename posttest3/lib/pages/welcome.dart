import 'package:flutter/material.dart';

// StatelessWidget karena kontennya statis
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menampilkan gambar logo dari folder assets
              Image.asset(
                'lib/assets/images/logo_vivofive.png',
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                "Selamat Datang di\nVivoFive Futsal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              // Tombol utama untuk navigasi ke halaman login
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text("Masuk"),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Tombol kedua untuk navigasi ke halaman register
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF4CAF50)),
                    ),
                    child: const Text(
                      "Belum punya akun? Daftar",
                      style: TextStyle(color: Color(0xFF4CAF50)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Dengan masuk atau mendaftar, kamu menyetujui\nketentuan layanan dan kebijakan privasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}