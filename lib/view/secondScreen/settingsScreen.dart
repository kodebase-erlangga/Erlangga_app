import 'package:erl_app/view/settingsScreen/validasidetail.dart';
import 'package:flutter/material.dart';
import 'package:erl_app/view/settingsScreen/detailprofile.dart';

import '../mainScreen/berandaScreen.dart';
import '../settingsScreen/appbarSettings.dart'; // Import the ProfileCardView widget
import '../settingsScreen/cardview_apknhelp.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSettings(
        onBackPressed: () {
          // Navigate back to berandaScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BerandaScreen()),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Validasidetail(),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CardViewApkNHelp(),
            )
          ],
        ),
      ),
    );
  }
}
