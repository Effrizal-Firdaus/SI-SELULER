// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_aplikasi/main.dart';

void main() {
  testWidgets('login UI does not require credentials or navigate', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Saya membutuhkan bantuan'));
    await tester.pump();
    await tester.tap(find.byKey(const Key('continueButton')));
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.byKey(const Key('accountSubmitButton')));
    await tester.tap(find.byKey(const Key('accountSubmitButton')));
    await tester.pumpAndSettle();

    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Kata Sandi'), findsOneWidget);
    expect(find.text('Buat Akun'), findsNothing);
    expect(find.text('Konfirmasi Kata Sandi'), findsNothing);
    expect(find.text('Akun belum terdaftar.'), findsNothing);
  });
}
