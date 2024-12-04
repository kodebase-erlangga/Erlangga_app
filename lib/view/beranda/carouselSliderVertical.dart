import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class CarouselSliderVertical extends StatefulWidget {
  @override
  _CarouselSliderVerticalState createState() => _CarouselSliderVerticalState();
}

class _CarouselSliderVerticalState extends State<CarouselSliderVertical> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  final List<Map<String, String>> items = [
    {
      "title": "Baca Buku Kapan Saja, Dimana Saja!",
      "subtitle": "Dapatkan e-book Erlangga di gawai mu",
      "image": "assets/Images/CarouselSliderVertical/membacaBuku.png",
    },
    {
      "title": "Beli Buku Diujung Jari Mu!",
      "subtitle": "Nikmati kemudahan belanja buku dari Shop Erlangga.",
      "image": "assets/Images/CarouselSliderVertical/membeliBuku.png",
    },
    {
      "title": "Guru kesulitan mencari materi?",
      "subtitle":
          "Erklika hadirkan semua yang dibutuhkan guru",
      "image": "assets/Images/CarouselSliderVertical/mengajar.png",
    },
    {
      "title": "Tak ingin nilaimu turun?",
      "subtitle":
          "Ayo mulai belajar dengan buku-buku Erlangga",
      "image": "assets/Images/CarouselSliderVertical/nilai.png",
    },
    {
      "title": "Ujian Tanpa Kertas, Lebih Praktis!",
      "subtitle": "Gunakan Exam Erlangga dan lakukan ujian secara digital.",
      "image": "assets/Images/CarouselSliderVertical/ujian.png",
    },
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Start the timer to change the page every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentIndex < items.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0; // Loop back to the first item
        });
      }
      // Use the CarouselController to change the page
      _carouselController.animateToPage(_currentIndex);
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel Slider
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: items.length,
          itemBuilder: (context, index, realIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and subtitle in Row with image on the right
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add space to the left side for the indicator
                    SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title text
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              items[index]["title"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Subtitle text
                          Wrap(
                            children: [
                              Text(
                                items[index]["subtitle"]!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Image on the right side
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                        items[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            );
          },
          options: CarouselOptions(
            height: 140.0,
            enlargeCenterPage: true,
            scrollDirection: Axis.vertical,
            enableInfiniteScroll: true, // Infinite loop enabled
            viewportFraction: 0.8,
            initialPage: _currentIndex,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        Positioned(
          left: 10,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              items.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Color.fromARGB(255, 255, 0, 0)
                      : Color.fromARGB(255, 51, 0, 255),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
