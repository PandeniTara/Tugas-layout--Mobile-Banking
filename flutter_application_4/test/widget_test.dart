import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_4/main.dart'; // Sesuaikan dengan path proyek Anda

void main() {
  testWidgets('Counter bertambah saat tombol + ditekan', (WidgetTester tester) async {
    // Bangun aplikasi
    await tester.pumpWidget(const MyApp());

    // Pastikan teks "You have pushed the button this many times" muncul
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);

    // Pastikan counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Temukan FloatingActionButton dengan ikon '+'
    final Finder addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);

    // Ketuk tombol '+'
    await tester.tap(addButton);
    await tester.pump();

    // Pastikan counter bertambah menjadi 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
