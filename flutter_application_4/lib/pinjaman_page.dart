import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'providers/mutasi_provider.dart';

class PinjamanPage extends StatefulWidget {
  const PinjamanPage({super.key});

  @override
  State<PinjamanPage> createState() => _PinjamanPageState();
}

class _PinjamanPageState extends State<PinjamanPage> {
  final TextEditingController jumlahPinjamanController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  String selectedDurasi = '12 Bulan';
  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = jumlahPinjamanController.text.isNotEmpty;
    });
  }

  void _handleAjukan() {
    // Validasi sederhana
    final jumlah = double.tryParse(jumlahPinjamanController.text.replaceAll('.', '').replaceAll(',', '')) ?? 0;
    if (jumlah <= 0) {
      _showDialog("Jumlah pinjaman tidak valid.");
      return;
    }

    // Simulasi pengajuan berhasil
    context.read<MutasiProvider>().tambahMutasi(
      MutasiItem(
        jenis: 'Pinjaman',
        tanggal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        nominal: jumlah,
        tipe: 'in',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pengajuan pinjaman $selectedDurasi berhasil!")),
    );

    jumlahPinjamanController.clear();
    catatanController.clear();
    setState(() {
      isButtonEnabled = false;
      selectedDurasi = '12 Bulan';
    });
  }

  void _showDialog(String pesan) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Informasi"),
        content: Text(pesan),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    jumlahPinjamanController.addListener(_validateForm);
  }

  @override
  void dispose() {
    jumlahPinjamanController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pinjaman"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(Icons.assignment_turned_in, size: 50, color: Color(0xFF243C94)),
              const SizedBox(height: 10),
              const Text("Ajukan Pinjaman", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: jumlahPinjamanController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Jumlah Pinjaman",
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: selectedDurasi,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                        labelText: "Durasi Cicilan (bulan)",
                      ),
                      items: const [
                        DropdownMenuItem(value: '6 Bulan', child: Text('6 Bulan')),
                        DropdownMenuItem(value: '12 Bulan', child: Text('12 Bulan')),
                        DropdownMenuItem(value: '18 Bulan', child: Text('18 Bulan')),
                        DropdownMenuItem(value: '24 Bulan', child: Text('24 Bulan')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedDurasi = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: catatanController,
                      decoration: const InputDecoration(
                        hintText: "Catatan (opsional)",
                        prefixIcon: Icon(Icons.edit_note),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: isButtonEnabled ? _handleAjukan : null,
                      icon: const Icon(Icons.send),
                      label: const Text("Ajukan Pinjaman"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: const Color(0xFF243C94),
                        disabledBackgroundColor: const Color(0xFF9BA6C1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
