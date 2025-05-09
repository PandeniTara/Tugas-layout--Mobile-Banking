import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MutasiItem {
  final String jenis;
  final String tanggal;
  final double nominal;
  final String tipe; // 'in' atau 'out'

  MutasiItem({
    required this.jenis,
    required this.tanggal,
    required this.nominal,
    required this.tipe,
  });
}

class MutasiProvider with ChangeNotifier {
  final List<MutasiItem> _mutasiList = [];

  List<MutasiItem> get mutasiList => List.unmodifiable(_mutasiList);

  void tambahMutasi(MutasiItem item) {
    _mutasiList.insert(0, item); // terbaru di atas
    notifyListeners();
  }
}
