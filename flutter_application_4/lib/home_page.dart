import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'saldo_page.dart';
import 'transfer_page.dart';
import 'deposito_page.dart';
import 'pembayaran_page.dart';
import 'pinjaman_page.dart';
import 'mutasi_page.dart';
import 'profile_page.dart';
import 'providers/nasabah_provider.dart';
import 'setting_page.dart';

class MainMenu extends StatefulWidget {
  final String username;
  const MainMenu({super.key, required this.username});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Koperasi Undiksha',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await context.read<UserProvider>().logout();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    // Kartu Profil Pengguna dengan border luar
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade800, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 241, 244, 247),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/Tara.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
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
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.blue.shade800, width: 1),
                                  ),
                                  child: Consumer<NasabahProvider>(
                                    builder: (context, nasabah, _) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Total Saldo Anda", style: TextStyle(fontWeight: FontWeight.bold)),
                                        Text("Rp. ${nasabah.saldo.toStringAsFixed(0)}"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade800, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        childAspectRatio: 1,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          _buildMenuItem(context, Icons.account_balance_wallet, "Cek Saldo", const SaldoPage()),
                          _buildMenuItem(context, Icons.send, "Transfer", const TransferPage()),
                          _buildMenuItem(context, Icons.savings, "Deposito", const DepositoPage()),
                          _buildMenuItem(context, Icons.payment, "Pembayaran", const PembayaranPage()),
                          _buildMenuItem(context, Icons.account_balance, "Pinjaman", const PinjamanPage()),
                          _buildMenuItem(context, Icons.receipt, "Mutasi", const MutasiPage()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
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
                    const SizedBox(height: 30),
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
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SettingPage()),
                                  );
                                },
                                child: Icon(Icons.settings, color: Colors.blue.shade800, size: 50),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Setting",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(width: 40),
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
                          const SizedBox(width: 50),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ProfilePage()),
                              );
                            },
                            child: Column(
                              children: [
                                Icon(Icons.person, color: Colors.blue.shade800, size: 50),
                                const SizedBox(height: 5),
                                const Text(
                                  "Profile",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
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

// Tambahkan fungsi buildMenuItem di bawah sini
Widget _buildMenuItem(BuildContext context, IconData icon, String title, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade800, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    ),
  );
}

void main() {
  runApp(const MaterialApp(home: MainMenu(username: "user123")));
}