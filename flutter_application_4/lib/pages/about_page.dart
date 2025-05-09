import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/Logo_undiksha.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Koperasi Undiksha",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Versi 1.0.0",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoCard(
              title: "Deskripsi",
              content: "Aplikasi mobile banking Koperasi Undiksha yang memudahkan nasabah dalam melakukan transaksi keuangan secara digital.",
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: "Pengembang",
              content: "Ni Kadek Pandeni Tara Apsari\n2315091011",
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: "Kontak",
              content: "Email: pandeni@student.undiksha.ac.id\nPhone: 083114650265",
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: "Alamat",
              content: "Universitas Pendidikan Ganesha\nJl. Udayana No.11, Singaraja, Bali",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF243C94),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
} 