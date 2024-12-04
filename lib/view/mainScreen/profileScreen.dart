import 'package:flutter/material.dart';
import 'package:erl_app/view/profileScreen/appbarProfile.dart';
import '../settingsScreen/validasidetail.dart'; // Pastikan ini adalah path yang benar untuk `Validasidetail`

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: const AppbarProfile(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Validasidetail(), 
      ),
    );
  }
}
