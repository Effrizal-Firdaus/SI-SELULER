import 'package:flutter/material.dart';

import 'pilih_peran_page.dart' show PeranPengguna;
import '../../pengguna/screens/minta_bantuan_page.dart' show MyHomePage;

class HalamanAkunPage extends StatefulWidget {
  const HalamanAkunPage({super.key, required this.peran});

  final PeranPengguna peran;

  @override
  State<HalamanAkunPage> createState() => _HalamanAkunPageState();
}

class _HalamanAkunPageState extends State<HalamanAkunPage> {
  bool _buatAkun = false;
  bool _kataSandiTerlihat = false;

  InputDecoration _dekorasiKolom({
    required String petunjuk,
    Widget? awalan,
    Widget? akhiran,
  }) {
    return InputDecoration(
      hintText: petunjuk,
      hintStyle: const TextStyle(color: Color(0xFF8C96A5)),
      prefixIcon: awalan,
      suffixIcon: akhiran,
      filled: true,
      fillColor: const Color(0xFF171E28),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF273140)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF3B62F6), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color(0xFF0C1015),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C1015),
        foregroundColor: Colors.white,
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 28),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Text(
                        _buatAkun
                        ? widget.peran == PeranPengguna.inginMembantu
                          ? 'Menjadi Relawan'
                          : 'Menjadi Tuna Netra'
                        : 'Selamat Datang Kembali',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _buatAkun
                          ? 'Daftar sebagai ${widget.peran == PeranPengguna.membutuhkanBantuan ? 'pengguna' : 'relawan'} untuk melanjutkan.'
                          : 'Silakan masuk untuk melanjutkan.',
                      style: const TextStyle(color: Color(0xFF9AA4B2)),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      key: const Key('emailField'),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(color: Colors.white),
                      decoration: _dekorasiKolom(
                        petunjuk: 'nama@email.com',
                        awalan: const Icon(
                          Icons.mail_outline,
                          color: Color(0xFF8C96A5),
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      _buatAkun ? 'Kata Sandi Baru' : 'Kata Sandi',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      key: const Key('passwordField'),
                      obscureText: !_kataSandiTerlihat,
                      textInputAction: _buatAkun
                          ? TextInputAction.next
                          : TextInputAction.done,
                      autofillHints: [
                        _buatAkun
                            ? AutofillHints.newPassword
                            : AutofillHints.password,
                      ],
                      style: const TextStyle(color: Colors.white),
                      decoration: _dekorasiKolom(
                        petunjuk: _buatAkun
                            ? 'Minimal 8 karakter'
                            : 'Kata sandi',
                        awalan: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF8C96A5),
                          size: 20,
                        ),
                        akhiran: IconButton(
                          tooltip: _kataSandiTerlihat
                              ? 'Sembunyikan kata sandi'
                              : 'Tampilkan kata sandi',
                          onPressed: () => setState(
                            () => _kataSandiTerlihat = !_kataSandiTerlihat,
                          ),
                          icon: Icon(
                            _kataSandiTerlihat
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF8C96A5),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    if (_buatAkun) ...[
                      const SizedBox(height: 18),
                      const Text(
                        'Konfirmasi Kata Sandi',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        key: const Key('confirmPasswordField'),
                        obscureText: !_kataSandiTerlihat,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(color: Colors.white),
                        decoration: _dekorasiKolom(
                          petunjuk: 'Ulangi kata sandi baru',
                          awalan: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF8C96A5),
                            size: 20,
                          ),
                        ),
                      ),
                    ] else
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Lupa Kata Sandi?'),
                        ),
                      ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        key: const Key('accountSubmitButton'),
                        onPressed: _buatAkun ||
                          widget.peran == PeranPengguna.inginMembantu
                            ? () {}
                            : () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyHomePage(),
                                ),
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B62F6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _buatAkun ? 'BUAT AKUN' : 'MASUK',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(color: Color(0xFF273140)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            _buatAkun ? 'SUDAH PUNYA AKUN?' : 'PENGGUNA BARU?',
                            style: const TextStyle(
                              color: Color(0xFF9AA4B2),
                              fontSize: 11,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(color: Color(0xFF273140)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => setState(() => _buatAkun = !_buatAkun),
                      child: Text(
                        _buatAkun ? 'Masuk' : 'Buat Akun',
                        style: const TextStyle(
                          color: Color(0xFF3B62F6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
}