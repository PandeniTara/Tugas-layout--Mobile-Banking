import 'package:flutter/material.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({super.key});

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  bool _transactionNotification = true;
  bool _promoNotification = true;
  bool _securityNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Notifikasi"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationCard(
            title: "Notifikasi Transaksi",
            subtitle: "Dapatkan pemberitahuan untuk setiap transaksi",
            value: _transactionNotification,
            onChanged: (value) {
              setState(() {
                _transactionNotification = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildNotificationCard(
            title: "Notifikasi Promo",
            subtitle: "Dapatkan informasi promo terbaru",
            value: _promoNotification,
            onChanged: (value) {
              setState(() {
                _promoNotification = value!;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildNotificationCard(
            title: "Notifikasi Keamanan",
            subtitle: "Dapatkan pemberitahuan aktivitas keamanan",
            value: _securityNotification,
            onChanged: (value) {
              setState(() {
                _securityNotification = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
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
} 