import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'providers/nasabah_provider.dart';
import 'providers/mutasi_provider.dart';

class DepositoPage extends StatefulWidget {
  const DepositoPage({super.key});

  @override
  State<DepositoPage> createState() => _DepositoPageState();
}

class _DepositoPageState extends State<DepositoPage> {
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = jumlahController.text.isNotEmpty && tokenController.text.isNotEmpty;
    });
  }

  void _showKonfirmasiDialog(double jumlah) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Konfirmasi Deposito"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Apakah Anda yakin ingin mendepositokan sejumlah:"),
              const SizedBox(height: 10),
              Text(
                NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2).format(jumlah),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal", style: TextStyle(color: Colors.purple)),
            ),
            ElevatedButton(
              onPressed: () {
                _handleSetor(jumlah);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Ya, Setor"),
            ),
          ],
        );
      },
    );
  }

  void _handleSetor(double jumlah) {
    final saldoSekarang = context.read<NasabahProvider>().saldo;
    if (jumlah > saldoSekarang) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Saldo tidak mencukupi.")),
      );
      return;
    }
    context.read<NasabahProvider>().updateSaldo(saldoSekarang - jumlah);
    context.read<MutasiProvider>().tambahMutasi(
      MutasiItem(
        jenis: 'Deposito',
        tanggal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        nominal: jumlah,
        tipe: 'out',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Deposito sebesar Rp ${jumlah.toStringAsFixed(2)} berhasil!")),
    );
    jumlahController.clear();
    tokenController.clear();
    setState(() {
      isButtonEnabled = false;
    });
  }

  @override
  void initState() {
    super.initState();
    jumlahController.addListener(_validateForm);
    tokenController.addListener(_validateForm);
  }

  @override
  void dispose() {
    jumlahController.dispose();
    tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saldo = context.watch<NasabahProvider>().saldo;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposito"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 40),
              Icon(
                Icons.savings,
                size: 80,
                color: Color(0xFF243C94),
              ),
              SizedBox(height: 20),
              Text(
                "Saldo Saat Ini: ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2).format(saldo)}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
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
                      controller: jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Jumlah Deposito",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: tokenController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Token",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              final jumlah = double.tryParse(jumlahController.text.replaceAll('.', '').replaceAll(',', '')) ?? 0;
                              if (jumlah <= 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Jumlah deposito tidak valid.")),
                                );
                                return;
                              }
                              _showKonfirmasiDialog(jumlah);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: const Color(0xFF243C94),
                        disabledBackgroundColor: const Color(0xFF9BA6C1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Setor"),
                    ),
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
