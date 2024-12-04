import 'package:erl_app/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardViewIconSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Membagi ikon menjadi grup per halaman, setiap halaman maksimal 10 ikon
    final List<List<String>> pages = [];
    for (int i = 0; i < icons.length; i += 10) {
      pages.add(icons.sublist(i, i + 10 > icons.length ? icons.length : i + 10));
    }

    // Controller untuk PageView
    final PageController pageController = PageController();

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: 350,
        height: 250, // Menambahkan sedikit tinggi agar indikator tidak terpotong
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                final currentIcons = pages[pageIndex]; // Ikon untuk halaman saat ini
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Baris pertama: Maksimal 5 ikon
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          5,
                          (index) => index < currentIcons.length
                              ? Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIcons[index],
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(height: 4),
                                    Text(animals[index], style: TextStyle(fontSize: 12)),
                                  ],
                                )
                              : SizedBox(width: 40), // Placeholder jika kurang dari 5 ikon
                        ),
                      ),
                    ),
                    // Baris kedua: Maksimal 5 ikon
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          5,
                          (index) => (index + 5) < currentIcons.length
                              ? Column(
                                  children: [
                                    SvgPicture.asset(
                                      currentIcons[index + 5],
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(height: 4),
                                    Text(animals[index + 5], style: TextStyle(fontSize: 12)),
                                  ],
                                )
                              : SizedBox(width: 40), // Placeholder jika kurang dari 10 ikon
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Indikator berbentuk bar di bawah
            Positioned(
              bottom: 8, // Menempatkan indikator di bawah
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: pageController, // Menggunakan controller dari PageView
                  count: pages.length, // Jumlah halaman
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    spacing: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
