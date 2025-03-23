import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final String username;
  const MainMenu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar (Bagian atas aplikasi)
      appBar: AppBar(
  backgroundColor: Colors.blue.shade800,
  iconTheme: const IconThemeData(color: Colors.white), // Mengubah ikon back menjadi putih
  title: const Text(
    'Koperasi Undiksha',
    style: TextStyle(color: Colors.white),
  ),
  actions: [
    IconButton(
      onPressed: () {}, // Fungsi logout (belum diimplementasikan)
      icon: const Icon(Icons.exit_to_app, color: Colors.white), // Ikon logout juga putih
    )
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Kartu Profil Pengguna dengan border luar
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800, width: 2), // Garis luar kartu profil
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 241, 244, 247),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  // Foto Profil diperbesar (80x80) dan berbentuk kotak
                  Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5), // Membuat kotak dengan sedikit lengkungan
    image: DecorationImage(
      image: AssetImage('assets/images/Tara.jpeg'), // Ganti dengan path gambar yang benar
      fit: BoxFit.cover, // Menyesuaikan ukuran gambar agar mengisi kotak
    ),
  ),
),

                  const SizedBox(width: 20), // Jarak lebih luas antara foto dan informasi

                  // Informasi Pengguna (Nama dan Saldo)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kotak Nama Nasabah
                        Container(
                          width: double.infinity, // Mengisi seluruh lebar
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue.shade800, width: 1),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nasabah", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Ni Kadek Pandeni Tara Apsari"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Kotak Total Saldo
                        Container(
                          width: double.infinity, // Mengisi seluruh lebar agar sejajar dengan foto profil
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.blue.shade800, width: 1),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Saldo Anda", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Rp. 1.200.000"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Kotak besar menu utama dengan border luar
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800, width: 2), // Border luar kotak menu
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: GridView.count(
                shrinkWrap: true, // Agar GridView menyesuaikan ukuran
                crossAxisCount: 3, // 3 kolom per baris
                childAspectRatio: 1, // Perbandingan lebar dan tinggi kotak menu
                physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll di dalam GridView
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _menuItem("Cek Saldo", Icons.account_balance_wallet),
                  _menuItem("Transfer", Icons.swap_horiz),
                  _menuItem("Deposito", Icons.account_balance),
                  _menuItem("Pembayaran", Icons.payment),
                  _menuItem("Pinjaman", Icons.attach_money),
                  _menuItem("Mutasi", Icons.article),
                ],
              ),
            ),

            const SizedBox(height: 30),

             // Kotak "Butuh Bantuan"
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Butuh Bantuan?",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "0878-1234-1024",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                  const Icon(Icons.phone, size: 60, color: Colors.blue),
                ],
              ),
            ),
             const SizedBox(height: 130), // Memberi jarak lebih jauh ke bawah
    
            // Kotak dengan Setting, QR Code, dan Profile
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue.shade800, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   
                  // Ikon Setting dengan teks di bawahnya
              Column(
                children: [
                  Icon(Icons.settings, color: Colors.blue.shade800, size: 50),
                  const SizedBox(height: 5), // Jarak antara ikon dan teks
                  const Text(
                    "Setting",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 40), // Jarak antara Setting dan QR Code
                 //Ikon QR Code dalam lingkaran
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade800,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(Icons.qr_code, size: 50, color: Colors.white),
              ),

              const SizedBox(width: 40), // Jarak antara QR Code dan Profile
                  Column(
                children: [
                  Icon(Icons.person, color: Colors.blue.shade800, size: 50),
                  const SizedBox(height: 5), // Jarak antara ikon dan teks
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
                   
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat menu item berbentuk kotak
  static Widget _menuItem(String title, IconData icon) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade800, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue.shade800),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MainMenu(username: "user123")));
}