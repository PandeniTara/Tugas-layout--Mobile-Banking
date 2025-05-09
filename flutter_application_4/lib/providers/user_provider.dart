import 'package:flutter/material.dart';
import '../services/preferences_service.dart';

class UserProvider with ChangeNotifier {
  String? _username;
  bool _isLoggedIn = false;

  String? get username => _username;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username, String password) async {
    // Simulasi login sederhana
    if (username.isNotEmpty && password.isNotEmpty && username == password) {
      _username = username;
      _isLoggedIn = true;
      
      // Simpan state ke SharedPreferences
      await PreferencesService.saveLoginState(true);
      await PreferencesService.saveUserCredentials(username, password);
      
      notifyListeners();
    } else {
      throw Exception('Username atau password salah');
    }
  }

  Future<void> logout() async {
    _username = null;
    _isLoggedIn = false;
    
    // Hapus data dari SharedPreferences
    await PreferencesService.clearUserData();
    
    notifyListeners();
  }

  Future<void> checkLoginState() async {
    final isLoggedIn = await PreferencesService.getLoginState();
    if (isLoggedIn) {
      final credentials = await PreferencesService.getUserCredentials();
      _username = credentials['username'];
      _isLoggedIn = true;
      notifyListeners();
    }
  }
} 