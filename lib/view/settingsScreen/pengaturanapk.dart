import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../secondScreen/settingsScreen.dart';

class PengaturanApk extends StatelessWidget {
  const PengaturanApk({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          },
        ),
        title: const Text("Pengaturan akun dan aplikasi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8), // Spasi kecil antara AppBar dan Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Pengaturan Aplikasi Row
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/apk.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Pengaturan Aplikasi",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Tambahkan navigasi jika diperlukan
                    },
                  ),
                  const Divider(height: 1, thickness: 1),

                  // Pilihan Bahasa Row
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/language.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Pilihan Bahasa",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Tambahkan navigasi jika diperlukan
                    },
                  ),
                  const Divider(height: 1, thickness: 1),

                  // Hapus Akun Row
                  ListTile(
                    leading: SvgPicture.asset(
                      'assets/icons/trash.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Hapus Akun",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Tambahkan navigasi jika diperlukan
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
