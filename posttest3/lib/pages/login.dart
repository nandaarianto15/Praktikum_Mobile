import 'package:flutter/material.dart';

// Dibuat dengan StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// State dari LoginPage, tempat menyimpan data yang bisa berubah
class _LoginPageState extends State<LoginPage> {
  // Deklarasi variabel untuk form, controller, dan state
  // Kunci untuk mengakses state Form
  final _formKey = GlobalKey<FormState>();
  // Controller untuk input email
  final TextEditingController _emailController = TextEditingController();
  // Controller untuk input password
  final TextEditingController _passwordController = TextEditingController();
  // State untuk switch "ingat saya"
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // AppBar dengan tombol kembali
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Mengarahkan kembali ke halaman welcome saat tombol ditekan
            Navigator.pushReplacementNamed(context, '/welcome');
          },
        ),
        title: const Text('Masuk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        // Widget Form untuk mengelola dan memvalidasi input pengguna
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Silakan masuk dengan email dan password mu",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 30),
              // Input untuk email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                // Fungsi validasi untuk memastikan input tidak kosong
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Input untuk password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                // Fungsi validasi untuk memastikan input tidak kosong
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // Toggle untuk fitur "ingat saya"
                  Switch(
                    value: _rememberMe,
                    onChanged: (bool value) {
                      // Memperbarui state saat switch diubah, memicu rebuild UI
                      setState(() {
                        _rememberMe = value;
                      });
                    },
                    activeColor: const Color(0xFF4CAF50),
                  ),
                  const Text('Ingat Saya'),
                ],
              ),
              const SizedBox(height: 30),
              // Tombol utama untuk proses masuk.
              ElevatedButton(
                onPressed: () {
                  // Validasi form dan navigasi ke home jika berhasil
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                child: const Text("Masuk"),
              ),
              const SizedBox(height: 20),
              // Tombol untuk aksi lupa password
              TextButton(
                onPressed: () {
                },
                child: const Text(
                  "Lupa Password?",
                  style: TextStyle(color: Color(0xFF4CAF50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}