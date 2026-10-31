import 'package:flutter/material.dart';

import 'pilih_peran_page.dart';

class SelamatDatangPage extends StatefulWidget {
  const SelamatDatangPage({super.key});

  @override
  State<SelamatDatangPage> createState() => _SelamatDatangPageState();
}

class _SelamatDatangPageState extends State<SelamatDatangPage> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PilihPeranPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/pp.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 24),
              const Text(
                'Menghubungkan manusia.\nMembantu melihat dunia.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
