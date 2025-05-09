import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Foto profil
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              backgroundImage: AssetImage('assets/images/Tara.jpeg'), // Ganti dengan path gambar Anda
            ),
            const SizedBox(height: 16),
            // Nama
            const Text(
              "Ni Kadek Pandeni Tara Apsari",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Nasabah Aktif",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 24),
            // Kartu info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NIM
                  const Text(
                    "NIM",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: const [
                      Icon(Icons.badge, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text("2315091011", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Divider(height: 24),
                  // Email
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: const [
                      Icon(Icons.email, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          "pandeni@student.undiksha.ac.id",
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  // No HP
                  const Text(
                    "No. HP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: const [
                      Icon(Icons.phone, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text("083114650265", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigasi ke halaman edit profil
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text("Edit Profil"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF243C94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
