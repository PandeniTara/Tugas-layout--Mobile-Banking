import 'package:flutter/material.dart';

class MutasiPage extends StatelessWidget {
  const MutasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mutasi")),
      body: const Center(
        child: Text(
          "Halaman Mutasi",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
