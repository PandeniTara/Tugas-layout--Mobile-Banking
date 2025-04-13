import 'package:flutter/material.dart';

class MutasiPage extends StatelessWidget {
  const MutasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar bagian atas
      appBar: AppBar(
        backgroundColor:Colors.blue.shade800,
        title: const Text('Mutasi', style: TextStyle(color: Colors.white)),
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Bagian tab Mutasi Transaksi dan e-Statement
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Mutasi Transaksi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text('e-Statement', style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Filter dropdown dan rentang waktu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sumber Rekening'),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.filter_alt_outlined),
                      SizedBox(width: 5),
                      Text('Rentang Waktu')
                    ],
                  ),
                )
              ],
            ),
          ),

          // List mutasi
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                _buildDateSection('5 Apr 2025', [
                  _buildTransaction('Bayar QRIS', '- Rp55.000,00', '19:40:48 WIB', Colors.black),
                ]),
                _buildDateSection('3 Apr 2025', [
                  _buildTransaction('Bayar QRIS', '- Rp93.000,00', '17:07:18 WIB', Colors.black),
                  _buildTransaction('Bayar QRIS', '- Rp94.220,00', '13:49:03 WIB', Colors.black),
                  _buildTransaction('6220240000090539#000009575263#ATM #TRFLA', '+ Rp500.000,00', '09:17:29 WIB', Colors.green),
                ]),
                _buildDateSection('27 Mar 2025', [
                  _buildTransaction('Pembayaran Merchant BOX\nOUTLET SINGARAJA via EDC 1078...', '- Rp128.000,00', '09:17:18 WIB', Colors.black),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget untuk bagian tanggal + list transaksi per tanggal
  Widget _buildDateSection(String date, List<Widget> transactions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        ...transactions,
        const SizedBox(height: 14),
      ],
    );
  }

  // Widget untuk satu transaksi
  Widget _buildTransaction(String title, String amount, String time, Color amountColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(amount, style: TextStyle(fontSize: 16, color: amountColor)),
            Text(time, style: const TextStyle(color: Colors.grey))
          ],
        ),
        const Divider(height: 20)
      ],
    );
  }
}
