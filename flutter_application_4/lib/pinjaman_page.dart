import 'package:flutter/material.dart';

class PinjamanPage extends StatelessWidget {
  const PinjamanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FB),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
         centerTitle: false,
        title: const Text(
          'Pinjaman',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Fungsi kembali
          }
       ),
      ),
      body: Column(
        children: [
          // Header Blue Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color:  Colors.blue,
            child: Column(
              children: const [
                Text(
                  'Total Sisa Pinjaman',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp-',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
            const SizedBox(height: 20),
          // Kotak Putih Menu
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            transform: Matrix4.translationValues(0, -30, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMenuItem(
                    context,
                    icon: Icons.note_add_outlined,
                    title: 'Ajukan Baru',
                    onTap: () {},
                  ),
                  const SizedBox(width: 24), // Jarak antar item
                  buildMenuItem(
                    context,
                    icon: Icons.payments_outlined,
                    title: 'Bayar Pinjaman\nLainnya',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),

          // Daftar Pinjamanmu
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Pinjamanmu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          const Spacer(),

          // Info bawah
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Ajukan pinjaman lebih mudah melalui Bank ini dengan '
              'kebebasan memilih jenis pinjaman yang sesuai untukmu. '
              'Ayo ajukan sekarang!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.blueAccent),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
