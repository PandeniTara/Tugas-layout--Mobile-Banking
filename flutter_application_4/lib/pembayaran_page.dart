import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/nasabah_provider.dart';
import 'providers/mutasi_provider.dart';
import 'package:intl/intl.dart';
import 'providers/mutasi_provider.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  final TextEditingController nomorPelangganController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  String selectedLayanan = 'Listrik';
  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = nomorPelangganController.text.isNotEmpty &&
          nominalController.text.isNotEmpty;
    });
  }

  void _handleBayar() {
    final nominal = double.tryParse(nominalController.text.replaceAll('.', '').replaceAll(',', '')) ?? 0;
    final saldoSekarang = context.read<NasabahProvider>().saldo;

    if (nominal <= 0) {
      _showDialog("Nominal pembayaran tidak valid.");
      return;
    }
    if (nominal > saldoSekarang) {
      _showDialog("Saldo tidak mencukupi.");
      return;
    }

    context.read<NasabahProvider>().updateSaldo(saldoSekarang - nominal);

    context.read<MutasiProvider>().tambahMutasi(
      MutasiItem(
        jenis: selectedLayanan,
        tanggal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        nominal: nominal,
        tipe: 'out',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pembayaran $selectedLayanan berhasil.")),
    );

    nomorPelangganController.clear();
    nominalController.clear();
    catatanController.clear();
    setState(() {
      isButtonEnabled = false;
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
    nomorPelangganController.addListener(_validateForm);
    nominalController.addListener(_validateForm);
  }

  @override
  void dispose() {
    nomorPelangganController.dispose();
    nominalController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Icon(Icons.credit_card, size: 50, color: Color(0xFF243C94)),
              const SizedBox(height: 10),
              const Text("Pembayaran Tagihan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                    DropdownButtonFormField<String>(
                      value: selectedLayanan,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.list),
                        border: OutlineInputBorder(),
                        labelText: "Pilih Layanan",
                      ),
                      items: const [
                        DropdownMenuItem(value: 'Listrik', child: Text('Listrik')),
                        DropdownMenuItem(value: 'Air', child: Text('Air')),
                        DropdownMenuItem(value: 'Internet', child: Text('Internet')),
                        DropdownMenuItem(value: 'Telepon', child: Text('Telepon')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedLayanan = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nomorPelangganController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Nomor Pelanggan",
                        prefixIcon: Icon(Icons.account_box),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: nominalController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Nominal Pembayaran",
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
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
                      onPressed: isButtonEnabled ? _handleBayar : null,
                      icon: const Icon(Icons.send),
                      label: const Text("Bayar"),
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
