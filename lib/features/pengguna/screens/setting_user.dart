import 'package:flutter/material.dart';
import 'minta_bantuan_page.dart'; // Import halaman beranda

class SettingUserPage extends StatefulWidget {
  const SettingUserPage({super.key});

  @override
  State<SettingUserPage> createState() => _SettingUserPageState();
}

class _SettingUserPageState extends State<SettingUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1017), // Warna background gelap
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1017),
        elevation: 0,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          children: [
            // 1. Kartu Profil
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF131B2A),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // --- AVATAR SUDAH DIREVISI MENGGUNAKAN ASSET LOKAL ---
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF3B62F6), width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile_user.png', // Path disesuaikan
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // ----------------------------------------------------
                  const SizedBox(width: 16),
                  // Info Nama & Email
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Alex Morgan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'alex@example.com',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tombol Edit
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, size: 16, color: Color(0xFF60A5FA)),
                    label: const Text(
                      'Edit Profil',
                      style: TextStyle(color: Color(0xFF60A5FA), fontSize: 13),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF192338),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 2. List Menu Pengaturan
            _buildMenuItem(
              icon: Icons.notifications_none_rounded,
              iconColor: const Color(0xFF60A5FA),
              title: 'Notifikasi',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.translate_rounded,
              iconColor: const Color(0xFF60A5FA),
              title: 'Bahasa',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.shield_outlined,
              iconColor: const Color(0xFF60A5FA),
              title: 'Privasi & Keamanan',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline_rounded,
              iconColor: const Color(0xFF60A5FA),
              title: 'Pusat Bantuan',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.lock_outline_rounded,
              iconColor: const Color(0xFF60A5FA),
              title: 'Ubah Kata Sandi',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.swap_horiz_rounded,
              iconColor: const Color(0xFF60A5FA),
              title: 'Ganti Peran',
              onTap: () {},
            ),
            
            // Menu Keluar (Warna Merah)
            _buildMenuItem(
              icon: Icons.logout_rounded,
              iconColor: const Color(0xFFEF4444), // Merah
              title: 'Keluar',
              titleColor: const Color(0xFFEF4444), // Merah
              onTap: () {},
            ),
          ],
        ),
      ),
      
      // 3. Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0B1017),
          border: Border(top: BorderSide(color: Color(0xFF1A2332), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: 1, // Set index ke-1 karena ini halaman pengaturan
          backgroundColor: const Color(0xFF0B1017),
          selectedItemColor: const Color(0xFF3B62F6),
          unselectedItemColor: const Color(0xFF64748B),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) {
              // JIKA KLIK BERANDA: Kembali ke MyHomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            }
          },
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

  // Fungsi bantuan untuk membuat List Menu agar kodenya tidak panjang
  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    Color titleColor = Colors.white,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF131B2A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Color(0xFF64748B),
        size: 16,
      ),
    );
  }
}