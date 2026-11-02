import 'package:flutter/material.dart';

class PermintaanBantuanPage extends StatelessWidget {
  const PermintaanBantuanPage({super.key});

  static const Color background = Color(0xFF0B0F14);
  static const Color cardColor = Color(0xFF18212D);
  static const Color primaryBlue = Color(0xFF2864F0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ICON NOTIFIKASI
                      Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryBlue.withOpacity(0.15),
                          border: Border.all(color: primaryBlue, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: primaryBlue.withOpacity(0.35),
                              blurRadius: 20,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),

                      // JUDUL DAN DESKRIPSI
                      const Column(
                        children: [
                          Text(
                            'Seseorang\nMembutuhkan Bantuan\nAnda',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.15,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Seseorang sedang meminta bantuan\nvisual.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),

                      // CARD INFORMASI PENGGUNA
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            // ICON PENGGUNA
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryBlue.withOpacity(0.12),
                                border: Border.all(
                                  color: primaryBlue,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(
                                Icons.question_mark_rounded,
                                color: primaryBlue,
                                size: 21,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // INFORMASI PENGGUNA
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pengguna Anonim',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Bantuan Visual',
                                    style: TextStyle(
                                      color: Color(0xFF8B9BB0),
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.orange,
                                        size: 7,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Menunggu relawan',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // TOMBOL TERIMA
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Aksi ketika relawan menerima bantuan
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Permintaan bantuan diterima!'),
                              ),
                            );
                            // TODO: Arahkan ke halaman video call
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const VideoCallPage()));
                          },
                          icon: const Icon(Icons.phone_outlined, size: 16),
                          label: const Text(
                            'TERIMA',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                        ),
                      ),

                      // TOMBOL TOLAK
                      SizedBox(
                        width: double.infinity,
                        height: 46,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Kembali ke halaman sebelumnya
                            Navigator.maybePop(context);
                          },
                          icon: const Icon(Icons.close_rounded, size: 16),
                          label: const Text(
                            'TOLAK',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: cardColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
