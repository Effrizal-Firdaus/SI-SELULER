import 'package:flutter/material.dart';

import 'pilih_peran_page.dart' show PeranPengguna;
import '../../pengguna/screens/menu_utama_page.dart';

class HalamanPeranPage extends StatelessWidget {
  const HalamanPeranPage({super.key, required this.peran});

  final PeranPengguna peran;

  @override
  Widget build(BuildContext context) {
    final membutuhkanBantuan = peran == PeranPengguna.membutuhkanBantuan;
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
        title: Text(membutuhkanBantuan ? 'Ruang Bantuan' : 'Ruang Relawan'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                membutuhkanBantuan
                    ? Icons.support_agent_rounded
                    : Icons.volunteer_activism_rounded,
                color: const Color(0xFF3B62F6),
                size: 76,
              ),
              const SizedBox(height: 20),
              Text(
                membutuhkanBantuan
                    ? 'Selamat datang. Pilih bantuan yang Anda perlukan.'
                    : 'Terima kasih sudah ingin membantu. Mari mulai menjadi relawan.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  height: 1.35,
                ),
              ),
              if (membutuhkanBantuan) ...[
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MenuUtamaPage(),
                      ),
                    ),
                    icon: const Icon(Icons.apps_rounded),
                    label: const Text('BUKA MENU BANTUAN'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B62F6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}