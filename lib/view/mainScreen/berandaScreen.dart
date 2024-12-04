import 'package:flutter/material.dart';
import 'package:erl_app/services/shared_preferences_helper.dart';
import 'package:erl_app/view/beranda/cardview_iconslider.dart';
import 'package:erl_app/view/beranda/cardview_validasiprofile.dart';
import 'package:erl_app/view/beranda/headerBeranda.dart';
import 'package:erl_app/view/beranda/carouselSliderVertical.dart';
import '../beranda/banner.dart'; // Make sure to import BannerWidget
import '../beranda/rekomendasi.dart';
import '../secondScreen/settingsScreen.dart';

class BerandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: HeaderBeranda(
                  onSettingsPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                  onSignOutPressed: () {
                    Future<void> _logout(BuildContext context) async {
                      // Clear login status from SharedPreferences
                      await SharedPreferencesHelper.clearLoginStatus();
                      // Navigate back to the login screen
                      Navigator.pushReplacementNamed(context, '/login');
                    }
                    _logout(context); // Call the logout function here
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CarouselSliderVertical(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CardViewValidasiProfile(),
              ),
              // Replace BannerItem with BannerWidget
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: BannerCarousel(), // Use BannerWidget here
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Rekomendasi(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CardViewIconSlider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
