import 'package:flutter/material.dart';

class PanggilanBerakhirPage extends StatefulWidget {
  const PanggilanBerakhirPage({super.key});

  @override
  State<PanggilanBerakhirPage> createState() => _PanggilanBerakhirPageState();
}

class _PanggilanBerakhirPageState extends State<PanggilanBerakhirPage> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1017), // Latar belakang gelap
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              
              // Ikon Centang Hijau
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A2E22), // Hijau gelap transparan
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: Color(0xFF4ADE80), // Hijau terang
                      size: 44,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Judul
              const Text(
                'Panggilan Berakhir',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Avatar Maya
              Center(
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1B2330),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF3B62F6),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'M',
                      style: TextStyle(
                        color: Color(0xFF60A5FA),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Nama Relawan
              const Text(
                'Maya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              const SizedBox(height: 4),
              
              // Durasi
              const Text(
                '05:32',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9AA4B2),
                  fontSize: 14,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Teks Pertanyaan Rating
              const Text(
                'Bagaimana pengalaman Anda?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Bintang Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                    icon: Icon(
                      index < _rating ? Icons.star_rounded : Icons.star_outline_rounded,
                      color: const Color(0xFFFBBF24), // Warna kuning emas
                      size: 36,
                    ),
                  );
                }),
              ),
              
              const Spacer(),
              
              // Tombol Selesai
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi untuk tombol selesai (misalnya kembali ke menu utama)
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B62F6),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Tombol Kembali ke Beranda
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF171F2C),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(
                        color: Color(0xFF222D3D),
                        width: 1,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}