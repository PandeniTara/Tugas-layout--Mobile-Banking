import 'package:flutter/material.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({super.key});

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  String _selectedLanguage = 'Indonesia';

  final List<Map<String, String>> _languages = [
    {'name': 'Indonesia', 'code': 'id'},
    {'name': 'English', 'code': 'en'},
    {'name': '日本語', 'code': 'ja'},
    {'name': '한국어', 'code': 'ko'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaturan Bahasa"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final language = _languages[index];
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
              title: Text(
                language['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              value: language['name']!,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
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