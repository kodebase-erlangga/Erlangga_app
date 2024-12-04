import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget AppbarAktivitas() {
  return AppBar(
    title: const Text(
      "Aktivitas",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      textAlign:TextAlign.left,
    ),
    centerTitle: true,
    actions: [
      IconButton(
        icon: SvgPicture.asset(
          'assets/icons/ask.svg',
          height: 24,
          width: 24,
        ),
        onPressed: () {
          // Aksi untuk ikon "ask"
        },
      ),
      IconButton(
        icon: SvgPicture.asset(
          'assets/icons/download.svg',
          height: 24,
          width: 24,
        ),
        onPressed: () {
          // Aksi untuk ikon "download"
        },
      ),
    ],
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 2,
  );
}
