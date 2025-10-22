import 'package:flutter/material.dart';

// Dibuat dengan StatefulWidget
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

// State dari RegisterPage, tempat menyimpan data yang bisa berubah
class _RegisterPageState extends State<RegisterPage> {
  // Deklarasi variabel untuk form, controller, dan state
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false; // State untuk checkbox syarat dan ketentuan

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
        title: const Text('Daftar'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        // Widget Form untuk mengelola dan memvalidasi input pengguna
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input untuk nama lengkap.
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Input untuk email.
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Input untuk nomor HP.
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: "Nomor HP",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor HP tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Input untuk password.
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
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
                  // Untuk persetujuan syarat dan ketentuan.
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (bool? value) {
                      // Memperbarui state saat checkbox diubah.
                      setState(() {
                        _agreeToTerms = value!;
                      });
                    },
                    activeColor: const Color(0xFF4CAF50),
                  ),
                  const Expanded(
                    child: Text('Saya menyetujui syarat dan ketentuan'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Validasi form, checkbox, dan navigasi ke home jika berhasil.
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agreeToTerms) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else if (!_agreeToTerms) {
                    // Menampilkan pesan error jika checkbox tidak dicentang.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Anda harus menyetujui syarat dan ketentuan'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}