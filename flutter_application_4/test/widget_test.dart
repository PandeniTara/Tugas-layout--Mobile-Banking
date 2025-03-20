import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_4/main.dart'; // Pastikan path benar

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Bangun aplikasi dan pastikan UI stabil
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();

    // Verifikasi bahwa counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Pastikan ada tombol '+' (FloatingActionButton)
    final addButton = find.byIcon(Icons.add);
    expect(addButton, findsOneWidget);

    // Tap tombol '+' dan render ulang frame
    await tester.tap(addButton);
    await tester.pump();

    // Verifikasi bahwa counter bertambah menjadi 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
