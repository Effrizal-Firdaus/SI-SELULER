import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'features/auth/screens/selamat_datang_page.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teman Netra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B62F6)),
        useMaterial3: true,
      ),
      home: const SelamatDatangPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
