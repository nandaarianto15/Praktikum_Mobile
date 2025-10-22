import 'package:flutter/material.dart';

// Halaman utama, StatefulWidget karena ada state yang berubah (tab yang dipilih)
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // State untuk melacak tab mana yang sedang aktif di BottomNavigationBar
  int _currentIndex = 0;

  // Data dummy untuk daftar lapangan
  final List<Map<String, String>> _lapangan = [
    {'name': 'Lapangan 1', 'type': 'Matras', 'price': 'Rp 125.000/jam'},
    {'name': 'Lapangan 2', 'type': 'Matras', 'price': 'Rp 125.000/jam'},
    {'name': 'Lapangan 3', 'type': 'Matras', 'price': 'Rp 150.000/jam'},
  ];

  // Data dummy untuk daftar artikel
  final List<String> _artikel = ['Artikel 1', 'Artikel 2', 'Artikel 3', 'Artikel 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar, menampilkan judul aplikasi
      appBar: AppBar(
        title: const Text('VivoFive Futsal'),
      ),
      // Drawer, menu navigasi samping yang dapat dibuka
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Color(0xFF4CAF50)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nanda Arianto',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'nandaarianto@gmail.com',
                    style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
      // BottomNavigationBar, navigasi utama di bagian bawah layar.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Memperbarui state untuk mengganti tampilan tab.
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF4CAF50),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    // Konten untuk tab Beranda
    if (_currentIndex == 0) {
      // ListView, widget utama yang memungkinkan konten di-scroll
      return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header User
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hello,", style: TextStyle(fontSize: 14, color: Colors.black54)),
                  const Text("Nanda Arianto", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Cari Lapangan...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Banner Promo
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "PROMO\nDiskon 20% untuk booking malam!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Daftar Lapangan
          const Text(
            "Lapangan Favorit",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // ListView.builder, membuat daftar lapangan
          ListView.builder(
            // Agar ListView builder menyesuaikan tinggi konten
            shrinkWrap: true, 
            // Nonaktifkan scroll pada ListView builder ini
            physics: const NeverScrollableScrollPhysics(), 
            itemCount: _lapangan.length,
            itemBuilder: (context, index) {
              final field = _lapangan[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.stadium, color: Color(0xFF4CAF50)),
                  title: Text(field['name']!),
                  subtitle: Text('${field['type']} - ${field['price']}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kamu memilih ${field['name']}')),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // Daftar Artikel
          const Text(
            "Artikel",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // ListView.builder (Horizontal), menampilkan daftar artikel yang bisa di-scroll kesamping
          SizedBox(
            height: 120,
            child: ListView.builder(
              // Membuat scroll menjadi horizontal
              scrollDirection: Axis.horizontal, 
              itemCount: _artikel.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _artikel[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
    // Konten untuk tab order
    else if (_currentIndex == 1) {
      return const Center(
        child: Text(
          "Halaman Order",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }
    // Konten untuk tab profil
    else {
      return const Center(
        child: Text(
          "Halaman Profil",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}