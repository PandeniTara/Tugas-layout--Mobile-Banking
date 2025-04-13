import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // === Menu Row ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _TransferMenu(icon: Icons.person_add_alt, label: "Penerima Baru"),
                _TransferMenu(icon: Icons.group_add, label: "Grup Baru"),
                _TransferMenu(icon: Icons.event_note, label: "Jadwal Transfer"),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 25),
          // === Favorite Section ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Favorit kamu", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 241, 184, 99),
                      child: const Icon(Icons.star, color: Color.fromARGB(255, 230, 244, 139)),
                    ),
                    title: const Text("Tambah", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Tambah penerima favorit, biar lebih mudah cari mereka."),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // === Search Bar ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Mau transfer ke siapa hari ini?",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // === Tab Bar ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color:  Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Tersimpan"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text("Terakhir"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          // === Receiver List ===
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Text("1/200 penerima", style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Ubah", style: TextStyle(color: Color.fromARGB(255, 191, 190, 189))),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: CircleAvatar(child: Text("NK")),
                  title: Text("Ni Kadek Pandeni Tara Apsari", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("JAGO • 105206070333"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TransferMenu extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TransferMenu({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade100,
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
