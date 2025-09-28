import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("L")),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 340,
              width: 340,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text("Image")),
            ),

            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Selamat datang di VivoFiveFutsal",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Masuk",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    "Belum punya akun? Daftar Dulu",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Dengan masuk atau mendaftar, kamu menyetujui\n"
                "ketentuan layanan dan kebijakan privasi",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}