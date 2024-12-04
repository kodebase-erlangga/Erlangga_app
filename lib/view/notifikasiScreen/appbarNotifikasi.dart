import 'package:flutter/material.dart';

class AppbarNotifikasi extends StatelessWidget implements PreferredSizeWidget {
  const AppbarNotifikasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Notifikasi",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white, // Ubah warna latar belakang ke putih
      elevation: 2, // Tambahkan sedikit bayangan
      centerTitle: false, // Judul di kiri
      iconTheme: const IconThemeData(color: Colors.black), // Ikon hitam
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
