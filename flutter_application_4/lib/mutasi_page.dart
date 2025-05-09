import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/mutasi_provider.dart';

class MutasiPage extends StatelessWidget {
  const MutasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mutasi"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Consumer<MutasiProvider>(
            builder: (context, mutasiProvider, _) => Column(
              children: [
                const Icon(Icons.bar_chart, size: 50, color: Color(0xFF243C94)),
                const SizedBox(height: 10),
                const Text(
                  "Riwayat Mutasi Rekening",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ...mutasiProvider.mutasiList.map((mutasi) => _buildMutasiCard(mutasi)).toList(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Center(
                      child: Text(
                        "copyright @2025 by Undiksha",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMutasiCard(MutasiItem mutasi) {
    final isIn = mutasi.tipe == 'in';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isIn ? Colors.green[50] : Colors.red[50],
            child: Icon(
              isIn ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIn ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mutasi.jenis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  mutasi.tanggal,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            "${isIn ? '+' : '-'} Rp ${mutasi.nominal.toStringAsFixed(0)}",
            style: TextStyle(
              color: isIn ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
