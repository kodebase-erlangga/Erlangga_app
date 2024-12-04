import 'package:flutter/material.dart';

class Rekomendasi extends StatelessWidget {
  final List<String> _images = [
    'assets/Images/rekomendasiAplikasi/elib.jpg',
    'assets/Images/rekomendasiAplikasi/ebook.jpg',
    'assets/Images/rekomendasiAplikasi/erklika.jpg',
    'assets/Images/rekomendasiAplikasi/assesment.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(
      viewportFraction: 0.7, // Memberikan efek overlap antar kartu
    );

    return SizedBox(
      height: 400, // Tinggi slider
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              // Logika transformasi animasi
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - value.abs()).clamp(0.8, 1.0);
              }

              // Logika untuk menentukan apakah gambar ada di tengah
              bool isCentered = value == 1.0;

              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Gambar aplikasi
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          _images[index],
                          fit: BoxFit.cover,
                          height: 300, // Tinggi gambar
                          width: 200, // Lebar gambar
                        ),
                      ),
                      // Tombol Install (muncul saat gambar di tengah)
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300), // Durasi animasi
                        opacity: isCentered ? 1.0 : 0.0, // Tombol muncul hanya jika di tengah
                        child: Positioned(
                          bottom: 0,
                          child: Container(
                            width: 200, // Lebar sesuai gambar
                            height: 50, // Tinggi tombol
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.8), // Warna biru transparan
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: TextButton(
                              onPressed: isCentered
                                  ? () {
                                      // Logika tombol install
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Install aplikasi ${index + 1} berhasil!',
                                          ),
                                        ),
                                      );
                                    }
                                  : null, // Disable jika tidak di tengah
                              child: const Text(
                                'INSTALL',
                                style: TextStyle(
                                  color: Colors.white, // Warna teks
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
