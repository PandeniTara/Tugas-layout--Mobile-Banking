import 'package:flutter/material.dart';
import 'pages/notification_setting_page.dart';
import 'pages/security_setting_page.dart';
import 'pages/language_setting_page.dart';
import 'pages/theme_setting_page.dart';
import 'pages/about_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Notifikasi
            _buildSettingCard(
              icon: Icons.notifications,
              title: "Notifikasi",
              subtitle: "Atur pengaturan notifikasi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationSettingPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Keamanan
            _buildSettingCard(
              icon: Icons.security,
              title: "Keamanan",
              subtitle: "Atur PIN dan keamanan akun",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecuritySettingPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Bahasa
            _buildSettingCard(
              icon: Icons.language,
              title: "Bahasa",
              subtitle: "Pilih bahasa aplikasi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LanguageSettingPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Tema
            _buildSettingCard(
              icon: Icons.palette,
              title: "Tema",
              subtitle: "Ubah tampilan aplikasi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemeSettingPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            // Tentang Aplikasi
            _buildSettingCard(
              icon: Icons.info,
              title: "Tentang Aplikasi",
              subtitle: "Informasi tentang aplikasi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required String title,
    required String subtitle,
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
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue.shade800),
        ),
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
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
} 