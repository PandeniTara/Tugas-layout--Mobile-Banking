import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart'; // Halaman MainMenu
import 'transfer_page.dart'; // Halaman Transfe
import 'providers/user_provider.dart';
import 'providers/nasabah_provider.dart';
import 'providers/mutasi_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NasabahProvider()),
        ChangeNotifierProvider(create: (_) => MutasiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/transfer': (context) => const TransferPage(),
        },
      ),
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

  @override
  void initState() {
    super.initState();
    // Cek status login saat halaman dibuka
    Future.microtask(() => 
      context.read<UserProvider>().checkLoginState()
    );
  }

  Future<void> _login() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username == "2315091011" && password == "2315091011") {
      // login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainMenu(username: username),
        ),
      );
    } else {
      // Login gagal, tampilkan pesan error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau password tidak benar!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: const Text('Koperasi Undiksha', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 50, bottom: 20),
                    child: Image.asset(
                      'assets/images/Logo_undiksha.png',
                      height: 210,
                    ),
                  ),
                  Padding(
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
                        mainAxisSize: MainAxisSize.min,
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
                ],
              ),
            ),
          ),
          // Copyright di bawah
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