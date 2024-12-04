import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import 'package:erl_app/services/shared_preferences_helper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    bool isLoggedIn = await SharedPreferencesHelper.getLoginStatus();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(
          context, '/home'); // Navigate to HomeScreen
    } else {
      Navigator.pushReplacementNamed(
          context, '/onbonding'); // Navigate to Onboarding/Login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/blue_bg.jpg'), // Background gambar
            fit: BoxFit.cover, // Menyesuaikan gambar dengan ukuran layar
          ),
        ),
        child: Center(
          child: Container(
            height: 350,
            width: 350,
            child: Image.asset(
              'assets/Images/superApp.png', // Gambar yang diambil dari folder assets/Images
              fit: BoxFit.cover, // Agar gambar menyesuaikan ukuran container
            ),
          ),
        ),
      ),
    );
  }
}
