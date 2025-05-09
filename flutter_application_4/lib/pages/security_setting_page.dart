import 'package:flutter/material.dart';

class SecuritySettingPage extends StatefulWidget {
  const SecuritySettingPage({super.key});

  @override
  State<SecuritySettingPage> createState() => _SecuritySettingPageState();
}

class _SecuritySettingPageState extends State<SecuritySettingPage> {
  bool _biometricEnabled = false;
  bool _transactionConfirmation = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Keamanan"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSecurityCard(
            title: "Autentikasi Biometrik",
            subtitle: "Gunakan sidik jari atau wajah untuk login",
            value: _biometricEnabled,
            onChanged: (value) {
              setState(() {
                _biometricEnabled = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildSecurityCard(
            title: "Konfirmasi Transaksi",
            subtitle: "Konfirmasi setiap transaksi dengan PIN",
            value: _transactionConfirmation,
            onChanged: (value) {
              setState(() {
                _transactionConfirmation = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            title: "Ubah PIN",
            onTap: () {
              // TODO: Implementasi perubahan PIN
            },
          ),
          const SizedBox(height: 16),
          _buildActionButton(
            title: "Ubah Password",
            onTap: () {
              // TODO: Implementasi perubahan password
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityCard({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
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
      child: SwitchListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.blue.shade800,
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
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
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
} 