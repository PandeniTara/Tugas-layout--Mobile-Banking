import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'providers/nasabah_provider.dart';
import 'providers/mutasi_provider.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController rekeningController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();

  bool isButtonEnabled = false;

  void _validateForm() {
    setState(() {
      isButtonEnabled = rekeningController.text.isNotEmpty && nominalController.text.isNotEmpty;
    });
  }

  void _showKonfirmasiDialog(double jumlah, String rekening) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Konfirmasi Transfer"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Apakah Anda yakin ingin mentransfer"),
              const SizedBox(height: 10),
              Text(
                NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2).format(jumlah),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 5),
              Text("ke rekening: $rekening"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal", style: TextStyle(color: Colors.purple)),
            ),
            ElevatedButton(
              onPressed: () {
                _handleTransfer(jumlah);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text("Ya, Transfer"),
            ),
          ],
        );
      },
    );
  }

  void _handleTransfer(double jumlah) {
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
        jenis: 'Transfer',
        tanggal: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        nominal: jumlah,
        tipe: 'out',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Transfer sebesar Rp ${jumlah.toStringAsFixed(2)} berhasil!")),
    );
    rekeningController.clear();
    nominalController.clear();
    setState(() {
      isButtonEnabled = false;
    });
  }

  @override
  void initState() {
    super.initState();
    rekeningController.addListener(_validateForm);
    nominalController.addListener(_validateForm);
  }

  @override
  void dispose() {
    rekeningController.dispose();
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final saldo = context.watch<NasabahProvider>().saldo;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Saldo"),
        backgroundColor: const Color(0xFF243C94),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: const Icon(Icons.send, size: 120, color: Color(0xFF243C94)),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      "Saldo Saat Ini: "+
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2).format(saldo),
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
                            controller: rekeningController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Nomor Rekening Tujuan",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: nominalController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Jumlah Transfer",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    final jumlah = double.tryParse(nominalController.text.replaceAll('.', '').replaceAll(',', '')) ?? 0;
                                    final rekening = rekeningController.text.trim();
                                    if (jumlah <= 0 || rekening.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Nomor rekening atau nominal tidak valid.")),
                                      );
                                      return;
                                    }
                                    _showKonfirmasiDialog(jumlah, rekening);
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
                            child: const Text("Transfer"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

