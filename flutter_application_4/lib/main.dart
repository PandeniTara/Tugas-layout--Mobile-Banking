import 'package:flutter/material.dart';
import 'menu.dart'; // Import file MainMenu yang sudah dipisah

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;
    if (username.isNotEmpty && password.isNotEmpty && username == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainMenu(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password salah!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header dengan logo
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 61, 131, 237),
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Column(
              children: [
                 const SizedBox(height: 20), // Tambahkan ini agar logo turun
                Image.asset('assets/images/Logo_undiksha.png', height: 120), // Pastikan logo ada
                const SizedBox(height: 10),
                const Text(
                  "Koperasi Undiksha",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Tambahkan ruang kosong untuk menurunkan form login
          const SizedBox(height: 200), // Ini yang ditambahkan

          // Form Login
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Menghindari form naik terlalu tinggi
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color.fromARGB(255, 61, 131, 237),
                    ),
                    onPressed: _login,
                    child: const Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: const Text("Daftar Mbanking")),
                      TextButton(onPressed: () {}, child: const Text("Lupa password?")),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Copyright di bagian bawah dengan background abu-abu
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey.shade300,
            child: const Center(
              child: Text(
                "copyright @2025 by Undiksha",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
