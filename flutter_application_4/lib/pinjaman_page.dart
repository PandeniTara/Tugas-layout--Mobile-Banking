import 'package:flutter/material.dart';

class PinjamanPage extends StatelessWidget {
  const PinjamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pinjaman")),
      body: const Center(
        child: Text(
          "Halaman Pinjaman",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
