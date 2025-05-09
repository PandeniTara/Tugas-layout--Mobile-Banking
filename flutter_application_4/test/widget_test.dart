import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_4/main.dart'; // Ganti dengan path projekmu

void main() {
  testWidgets('Login dengan username = password berhasil', (WidgetTester tester) async {
    // await tester.pumpWidget(const MyApp());

    // Masukkan username dan password
    await tester.enterText(find.byType(TextField).at(0), 'undiksha');
    await tester.enterText(find.byType(TextField).at(1), 'undiksha');

    // Tekan tombol login
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    // Periksa apakah halaman berikutnya muncul (bisa cek berdasarkan judul halaman atau komponen unik lainnya)
    expect(find.textContaining('Menu'), findsOneWidget); // Sesuaikan dengan konten halaman MainMenu
  });
}
