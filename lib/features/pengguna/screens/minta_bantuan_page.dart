import 'package:flutter/material.dart';

import 'cari_relawan_page.dart' show FindingVolunteerPage;
import 'setting_user.dart'; // Import halaman pengaturan

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1017),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Halo, Alex',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Ikon Settings di pojok kanan atas (Bisa diklik juga)
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingUserPage(),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1B2330),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FindingVolunteerPage(),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B62F6),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'MINTA BANTUAN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.8,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Terhubung dengan relawan',
                          style: TextStyle(
                            color: Color(0xFFE0E7FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0B1017),
          border: Border(
            top: BorderSide(
              color: Color(0xFF1A2332),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            // --- LOGIKA NAVIGASI DIPERBARUI DI SINI ---
            if (index == 1) {
              // Jika tab Pengaturan diklik, gunakan pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingUserPage(),
                ),
              );
            } else {
              // Jika tab Beranda diklik, biarkan state berubah
              setState(() {
                _selectedIndex = index;
              });
            }
            // ------------------------------------------
          },
          backgroundColor: const Color(0xFF0B1017),
          elevation: 0,
          selectedItemColor: const Color(0xFF3B62F6),
          unselectedItemColor: const Color(0xFF64748B),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.settings_outlined),
              ),
              label: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}