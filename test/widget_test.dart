// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_aplikasi/main.dart';
import 'package:flutter_aplikasi/features/pengguna/screens/minta_bantuan_page.dart';
import 'package:flutter_aplikasi/features/pengguna/screens/panggilan_berakhir_page.dart';
import 'package:flutter_aplikasi/features/pengguna/screens/tampilan_call_page.dart';

void main() {
  testWidgets('ending a call opens the call-ended page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: VideoCallPage()),
    );

    await tester.tap(find.text('AKHIRI PANGGILAN'));
    await tester.pumpAndSettle();

    expect(find.text('Panggilan Berakhir'), findsOneWidget);
  });

  testWidgets('rating enables finish, then home returns to request-help page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: PanggilanBerakhirPage()),
    );
    await tester.pumpAndSettle();

    ElevatedButton finishButton() => tester.widget<ElevatedButton>(
      find.ancestor(
        of: find.text('Selesai'),
        matching: find.byType(ElevatedButton),
      ),
    );
    ElevatedButton homeButton() => tester.widget<ElevatedButton>(
      find.ancestor(
        of: find.text('Kembali ke Beranda'),
        matching: find.byType(ElevatedButton),
      ),
    );

    expect(finishButton().onPressed, isNull);
    expect(homeButton().onPressed, isNull);

    await tester.tap(find.byIcon(Icons.star_outline_rounded).first);
    await tester.pumpAndSettle();
    expect(finishButton().onPressed, isNotNull);
    expect(homeButton().onPressed, isNull);

    await tester.tap(find.text('Selesai'));
    await tester.pumpAndSettle();
    expect(finishButton().onPressed, isNull);
    expect(homeButton().onPressed, isNotNull);

    await tester.tap(find.text('Kembali ke Beranda'));
    await tester.pumpAndSettle();

    expect(find.text('MINTA BANTUAN'), findsOneWidget);
  });

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
