import 'package:flutter/material.dart';

import 'halaman_akun_page.dart';

// Enum pengganti akun_simulasi.dart — dideklarasikan di sini
enum PeranPengguna { membutuhkanBantuan, inginMembantu }

class PilihPeranPage extends StatefulWidget {
  const PilihPeranPage({super.key});

  @override
  State<PilihPeranPage> createState() => _PilihPeranPageState();
}

class _PilihPeranPageState extends State<PilihPeranPage> {
  PeranPengguna? _peranTerpilih;

  void _bukaAkun() {
    final peran = _peranTerpilih;
    if (peran == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HalamanAkunPage(peran: peran)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const latar = Color(0xFF121212);

    return Scaffold(
      backgroundColor: latar,
      appBar: AppBar(backgroundColor: latar, foregroundColor: Colors.white),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bagaimana anda ingin menggunakan Teman Netra?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Pilih peran yang paling sesuai. Anda dapat mengubahnya nanti.',
                style: TextStyle(color: Colors.white70, fontSize: 17),
              ),
              const SizedBox(height: 32),
              _PilihanPeran(
                judul: 'Saya membutuhkan bantuan',
                keterangan: 'Saya penyandang disabilitas netra',
                ikon: Icons.accessibility_new_rounded,
                terpilih: _peranTerpilih == PeranPengguna.membutuhkanBantuan,
                onTap: () => setState(
                  () => _peranTerpilih = PeranPengguna.membutuhkanBantuan,
                ),
              ),
              const SizedBox(height: 16),
              _PilihanPeran(
                judul: 'Saya ingin membantu',
                keterangan: 'Saya ingin menjadi relawan',
                ikon: Icons.volunteer_activism_rounded,
                terpilih: _peranTerpilih == PeranPengguna.inginMembantu,
                onTap: () => setState(
                  () => _peranTerpilih = PeranPengguna.inginMembantu,
                ),
              ),
              const Spacer(),
              Semantics(
                button: true,
                enabled: _peranTerpilih != null,
                label: 'Lanjutkan',
                child: ElevatedButton(
                  key: const Key('continueButton'),
                  onPressed: _peranTerpilih == null ? null : _bukaAkun,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3B62F6),
                    disabledBackgroundColor: const Color(0xFF3A3A3A),
                    foregroundColor: Colors.white,
                    disabledForegroundColor: Colors.white54,
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'LANJUTKAN',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PilihanPeran extends StatelessWidget {
  const _PilihanPeran({
    required this.judul,
    required this.keterangan,
    required this.ikon,
    required this.terpilih,
    required this.onTap,
  });

  final String judul;
  final String keterangan;
  final IconData ikon;
  final bool terpilih;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: terpilih,
      label: '$judul. $keterangan',
      child: Material(
        color: terpilih ? const Color(0xFF14264A) : const Color(0xFF242424),
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            constraints: const BoxConstraints(minHeight: 112),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(
                color: terpilih ? const Color(0xFF3B62F6) : Colors.white30,
                width: terpilih ? 3 : 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Icon(ikon, color: const Color(0xFF3B62F6), size: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        judul,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        keterangan,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                if (terpilih)
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF3B62F6),
                    size: 28,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}