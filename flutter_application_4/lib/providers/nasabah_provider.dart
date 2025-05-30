import 'package:flutter/material.dart';

class NasabahProvider with ChangeNotifier {
  double _saldo = 1300000.0;
  String _nomorRekening = '1234567890';  // Default value, bisa diubah sesuai kebutuhan
  String _nama = 'Ni Kadek Pandeni Tara Apsari';  // Default value, bisa diubah sesuai kebutuhan

  double get saldo => _saldo;
  String get nomorRekening => _nomorRekening;
  String get nama => _nama;

  void updateSaldo(double newSaldo) {
    _saldo = newSaldo;
    notifyListeners();
  }

  void updateNasabahData({String? nomorRekening, String? nama}) {
    if (nomorRekening != null) _nomorRekening = nomorRekening;
    if (nama != null) _nama = nama;
    notifyListeners();
  }
} 