import 'package:flutter/material.dart';

class DepositoPage extends StatelessWidget {
  const DepositoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Deposito")),
      body: const Center(
        child: Text(
          "Halaman Deposito",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
