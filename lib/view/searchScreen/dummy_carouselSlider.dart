import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DummyCarouselSlider extends StatefulWidget {
  @override
  _DummyCarouselSliderState createState() => _DummyCarouselSliderState();
}

class _DummyCarouselSliderState extends State<DummyCarouselSlider> {
  final List<String> dummyBanners = [
    'assets/Images/dummyBanner/dummyBanner.png',
    'assets/Images/dummyBanner/dummyBanner1.png',
    'assets/Images/dummyBanner/dummyBanner2.png',
    'assets/Images/dummyBanner/dummyBanner3.png',
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Memastikan widget mengambil lebar penuh
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            items: dummyBanners.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: _carouselController,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.2, // Fleksibel
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 8),
          AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: dummyBanners.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.green,
              dotColor: Colors.grey,
            ),
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
          ),
        ],
      ),
    );
  }
}
