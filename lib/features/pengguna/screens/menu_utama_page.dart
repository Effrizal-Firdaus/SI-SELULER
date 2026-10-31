import 'package:flutter/material.dart';

class MenuUtamaPage extends StatelessWidget {
  const MenuUtamaPage({super.key});

  void _bukaFitur(BuildContext context, String namaFitur) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka Fitur: $namaFitur'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Menu Utama Teman Netra',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildMenuButton(
              label: 'Deteksi Objek',
              ikon: Icons.remove_red_eye,
              warnaTombol: const Color(0xFF3B62F6),
              warnaTeksIkon: Colors.white,
              onTap: () => _bukaFitur(context, 'Deteksi Objek'),
            ),
            _buildMenuButton(
              label: 'Membaca Teks',
              ikon: Icons.menu_book,
              warnaTombol: Colors.blueAccent,
              warnaTeksIkon: Colors.white,
              onTap: () => _bukaFitur(context, 'Membaca Teks'),
            ),
            _buildMenuButton(
              label: 'SOS Darurat',
              ikon: Icons.sos,
              warnaTombol: Colors.red,
              warnaTeksIkon: Colors.white,
              onTap: () => _bukaFitur(context, 'Panggilan Darurat'),
            ),
            _buildMenuButton(
              label: 'Navigasi GPS',
              ikon: Icons.explore,
              warnaTombol: Colors.green,
              warnaTeksIkon: Colors.white,
              onTap: () => _bukaFitur(context, 'Navigasi Suara'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required String label,
    required IconData ikon,
    required Color warnaTombol,
    required Color warnaTeksIkon,
    required VoidCallback onTap,
  }) {
    return Semantics(
      label: 'Tombol $label',
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: warnaTombol,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ikon, size: 48, color: warnaTeksIkon),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: warnaTeksIkon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
