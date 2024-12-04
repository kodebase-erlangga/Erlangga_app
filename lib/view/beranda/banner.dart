import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class BannerItem {
  final String bannerCover;
  final String linkUrl;

  BannerItem(this.bannerCover, this.linkUrl);
}

class BannerCarousel extends StatefulWidget {
  @override
  _BannerCarouselState createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  List<String> bannerImages = [];
  List<String> productUrls = [];
  bool isLoading = true;
  String erlStatusId = ''; // Variable to store the status ID

  @override
  void initState() {
    super.initState();
    _loadBannerData();
  }

  Future<void> _loadBannerData() async {
    var url = 'https://ebook.erlanggaonline.co.id';
    var response = await http.post(Uri.parse(url), body: {
      'user_email': 'mihsanrahman19@gmail.com',
      'user_password': 'ihsan111',
      'galery_device_id': 'fae3876e39143557',
      'user_version': 'proteksi',
      'id': '100',
      'aksi': 'ambilbanner_slider',
    });

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        var status = data['erlStatusId'];

        if (status is String) {
          erlStatusId = status;
        } else if (status is bool) {
          erlStatusId = status.toString();
        }

        if (erlStatusId == 'true') {
          List<dynamic> bannerArray = data['data'];
          List<BannerItem> bannerItems = [];

          for (int i = 0; i < bannerArray.length && i < 10; i++) {
            var bannerItem = bannerArray[i];
            if (bannerItem.containsKey('url_banner')) {
              String bannerCover = bannerItem['url_banner'];
              String linkUrl = bannerItem['url_produk'];
              bannerItems.add(BannerItem(bannerCover, linkUrl));
            }
          }

          setState(() {
            bannerImages = bannerItems.map((item) => item.bannerCover).toList();
            productUrls = bannerItems.map((item) => item.linkUrl).toList();
            isLoading = false;
          });
        } else {
          setState(() {
            erlStatusId = 'Error: $erlStatusId';
            isLoading = false;
          });
        }
      } catch (e) {
        print('Error decoding JSON: $e');
        setState(() {
          erlStatusId = 'Error: $e';
          isLoading = false;
        });
      }
    } else {
      setState(() {
        erlStatusId =
            'Failed to load data. Status code: ${response.statusCode}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: List.generate(3, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  width: 600,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                );
              }),
            ),
          )
        : erlStatusId == 'true'
            ? CarouselSlider.builder(
                itemCount: bannerImages.length,
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () {
                      _openWebView(context, productUrls[index]);
                    },
                    child: Image.network(
                      bannerImages[index],
                      height: 200,
                      width: 600,
                    ),
                  );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  scrollPhysics: BouncingScrollPhysics(),
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                ),
              )
            : Center(child: Text('Error: $erlStatusId'));
  }

  void _openWebView(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewApp(url: url),
      ),
    );
  }
}

class WebViewApp extends StatefulWidget {
  final String url;

  const WebViewApp({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product WebView')),
      body: WebViewWidget(controller: controller),
    );
  }
}
