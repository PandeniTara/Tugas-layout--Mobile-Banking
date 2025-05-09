import 'package:flutter/material.dart';

class NasabahProvider with ChangeNotifier {
  double _saldo = 1300000.0;

  double get saldo => _saldo;

  void updateSaldo(double newSaldo) {
    _saldo = newSaldo;
    notifyListeners();
  }
} 