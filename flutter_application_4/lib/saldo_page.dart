import 'package:flutter/material.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Saldo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kartu Saldo
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.blue.shade800,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: const [
                    Icon(Icons.account_balance_wallet, size: 60, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      'Saldo Anda',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp. 1.200.000',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tombol Tarik Dana
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigasi ke halaman tarik dana
                },
                icon: const Icon(Icons.money_off),
                label: const Text("Tarik Dana"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            // Tambahkan jarak di sini
            const SizedBox(height: 50),


            // Riwayat Transaksi (Mutasi)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Riwayat Saldo Terakhir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade800),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.arrow_downward, color: Colors.green),
                    title: Text("Transfer Masuk"),
                    subtitle: Text("01 April 2025"),
                    trailing: Text("+ Rp 500.000", style: TextStyle(color: Colors.green)),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_upward, color: Colors.red),
                    title: Text("Pembayaran Listrik"),
                    subtitle: Text("30 Maret 2025"),
                    trailing: Text("- Rp 250.000", style: TextStyle(color: Colors.red)),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_upward, color: Colors.red),
                    title: Text("Tarik Dana"),
                    subtitle: Text("29 Maret 2025"),
                    trailing: Text("- Rp 200.000", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
