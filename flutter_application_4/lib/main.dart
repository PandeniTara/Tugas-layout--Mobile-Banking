import 'package:flutter/material.dart';
import 'home_page.dart'; // Import file MainMenu yang sudah dipisah
import 'saldo_page.dart';
import 'transfer_page.dart';
import 'deposito_page.dart';
import 'pembayaran_page.dart';
import 'pinjaman_page.dart';
import 'mutasi_page.dart';


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
    appBar: AppBar(
      backgroundColor: Colors.blue.shade800,
      title: const Text('Koperasi Undiksha', style: TextStyle(color: Colors.white),),
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Column(
      children: [
        // Logo di atas
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Image.asset(
            'assets/images/Logo_undiksha.png', // Ganti dengan path gambar yang sesuai
            height: 210, // Ukuran lebih kecil agar layout lebih seimbang
          ),
        ),

        // Form Login (Pakai Expanded agar tidak terlalu panjang ke bawah)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 63, 135, 243),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(3, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Sesuai isi supaya tidak terlalu panjang
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.shade800,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue.shade800,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: const Color.fromARGB(255, 5, 62, 148),
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
        ),

        // Spacer agar copyright selalu di bawah
        const Spacer(),

        // Copyright (Align supaya selalu di bagian bawah)
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
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
        ),
      ],
    ),
  );
}

}
