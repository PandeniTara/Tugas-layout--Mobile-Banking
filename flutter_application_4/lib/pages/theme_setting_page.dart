import 'package:flutter/material.dart';

class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({super.key});

  @override
  State<ThemeSettingPage> createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  String _selectedTheme = 'Light';

  final List<Map<String, dynamic>> _themes = [
    {
      'name': 'Light',
      'icon': Icons.light_mode,
      'description': 'Tema terang untuk penggunaan siang hari',
    },
    {
      'name': 'Dark',
      'icon': Icons.dark_mode,
      'description': 'Tema gelap untuk penggunaan malam hari',
    },
    {
      'name': 'System',
      'icon': Icons.settings_suggest,
      'description': 'Mengikuti pengaturan sistem',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Tema"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _themes.length,
        itemBuilder: (context, index) {
          final theme = _themes[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
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
            child: RadioListTile<String>(
              title: Row(
                children: [
                  Icon(theme['icon'], color: Colors.blue.shade800),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theme['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        theme['description'],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              value: theme['name'],
              groupValue: _selectedTheme,
              onChanged: (value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
              activeColor: Colors.blue.shade800,
            ),
          );
        },
      ),
    );
  }
} 