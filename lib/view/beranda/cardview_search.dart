import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erl_app/view/secondScreen/searchScreen.dart'; // Import halaman SearchScreen

class CardViewSearch extends StatefulWidget {
  @override
  _CardViewSearchState createState() => _CardViewSearchState();
}

class _CardViewSearchState extends State<CardViewSearch> {
  int _currentHintIndex = 0;
  late Timer _timer;

  // Daftar hint yang akan ditampilkan
  final List<String> hints = [
    'Search for products...',
    'Search by category...',
    'Search by name...',
  ];

  @override
  void initState() {
    super.initState();
    // Timer untuk mengganti hint setiap 3 detik
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) { // Pastikan widget masih ada di tree
        setState(() {
          _currentHintIndex = (_currentHintIndex + 1) % hints.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
      },
      child: Container(
        width: 400, // Mengatur width menjadi 65
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(70.0),
          border: Border.all( // Menambahkan garis outline
            color: Colors.grey, 
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                height: 24,
                width: 24,
                color: Colors.grey[600],
              ),
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 1.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: TextField(
                  key: ValueKey<int>(_currentHintIndex), // Menggunakan key untuk memisahkan perubahan hint
                  decoration: InputDecoration(
                    hintText: hints[_currentHintIndex], // Mengakses hint
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  enabled: false, // Nonaktifkan input agar field hanya berfungsi sebagai tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
