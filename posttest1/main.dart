import 'dart:io'; // import agar bisa baca input user dari CLI

// =========================
// Class Lapangan
// =========================
class Lapangan {
  int id;               // atribut id lapangan
  String nama;          // atribut nama lapangan
  bool? isBooked;       // atribut status booking (nullable → null safety)
  String? namaPenyewa;  // simpan nama penyewa jika sudah booking

  Lapangan({required this.id, required this.nama, this.isBooked, this.namaPenyewa});

  // method untuk menampilkan status lapangan
  void tampilkanStatus() {
    // memakai ternary operator + null safety
    // jika booked, menampilkan nama penyewa juga
    print(
      '$nama status: ${isBooked == null ? "Belum dicek" : (isBooked! ? "Booked oleh ${namaPenyewa ?? "Tidak diketahui"}" : "Tersedia")}'
    );
  }
}

// =========================
// Class Booking
// =========================
class Booking {
  Lapangan lapangan;     // relasi ke class Lapangan (komposisi)
  String? namaPenyewa;   // nama penyewa (nullable → null safety)

  Booking({required this.lapangan, this.namaPenyewa});

  // method untuk melakukan booking
  void lakukanBooking() {
    if (lapangan.isBooked == true) {
      // kalau lapangan sudah dibooking
      // menampilkan juga nama yang booking
      print('Lapangan ${lapangan.nama} sudah dibooking oleh ${lapangan.namaPenyewa ?? "Tidak diketahui"}!');
    } else {
      // kalau belum, tandai sebagai booked
      lapangan.isBooked = true;
      lapangan.namaPenyewa = namaPenyewa; // simpan nama penyewa ke lapangan
      // null conditional: jika nama null maka diganti default
      print(
        'Berhasil booking lapangan ${lapangan.nama} untuk ${namaPenyewa ?? "Penyewa"}'
      );
    }
  }
}

// =========================
// Main Program
// =========================
void main() {
  print('=== Aplikasi Booking Lapangan Futsal ===\n');

  // 4 lapangan futsal
  var lapangan1 = Lapangan(id: 1, nama: "Lapangan A");
  var lapangan2 = Lapangan(id: 2, nama: "Lapangan B");
  var lapangan3 = Lapangan(id: 3, nama: "Lapangan C");
  var lapangan4 = Lapangan(id: 4, nama: "Lapangan D");

  // simpan semua lapangan dalam list
  var semuaLapangan = [lapangan1, lapangan2, lapangan3, lapangan4];

  // program jalan terus sampai user pilih keluar
  while (true) {
    print('\n--- Menu ---');
    print('1. Lihat Status Lapangan');
    print('2. Booking Lapangan');
    print('3. Keluar');
    stdout.write('Pilih menu: ');
    // input user
    var pilihan = stdin.readLineSync(); 

    if (pilihan == '1') {
      // tampilkan status semua lapangan
      for (var lap in semuaLapangan) {
        lap.tampilkanStatus();
      }
    } else if (pilihan == '2') {
      // tampilkan status dulu sebelum booking
      print('\nStatus Semua Lapangan:');
      for (var lap in semuaLapangan) {
        lap.tampilkanStatus();
      }

      // proses booking
      stdout.write('\nMasukkan nama penyewa: ');
      var nama = stdin.readLineSync();

      stdout.write('Pilih lapangan (1 = A, 2 = B, 3 = C, 4 = D): ');
      var pilihLapangan = stdin.readLineSync();

      // tentukan lapangan yang dipilih user
      Lapangan? lapanganDipilih;
      if (pilihLapangan == '1') {
        lapanganDipilih = lapangan1;
      } else if (pilihLapangan == '2') {
        lapanganDipilih = lapangan2;
      } else if (pilihLapangan == '3') {
        lapanganDipilih = lapangan3;
      } else if (pilihLapangan == '4') {
        lapanganDipilih = lapangan4;
      }

      // null conditional → cek apakah lapanganDipilih null atau tidak
      if (lapanganDipilih != null) {
        // jika nama kosong → simpan null
        var booking = Booking(
          lapangan: lapanganDipilih,
          namaPenyewa: nama?.isEmpty == true ? null : nama
        );
        booking.lakukanBooking();
      } else {
        print('Pilihan lapangan tidak valid!');
      }
    } else if (pilihan == '3') {
      // keluar dari loop
      print('Terima kasih sudah menggunakan aplikasi Booking Lapangan Futsal!');
      break;
    } else {
      // input menu salah
      print('Pilihan tidak valid, coba lagi.');
    }
  }
}
