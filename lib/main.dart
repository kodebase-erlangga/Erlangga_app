import 'package:flutter/material.dart';
import 'package:erl_app/component/routes.dart';
import 'package:erl_app/component/themes/color.dart';
import 'package:erl_app/component/themes/font.dart';
import 'package:erl_app/view/mainScreen/berandaScreen.dart';
import 'package:erl_app/view/mainScreen/aktivitasScreen.dart';
import 'package:erl_app/view/mainScreen/notifikasiScreen.dart';
import 'package:erl_app/view/mainScreen/profileScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryColor, // Use MaterialColor here
        fontFamily: AppFonts.primaryFont,
      ),
      initialRoute: Routes.splash,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BerandaScreen(),
    AktivitasScreen(),
    NotifikasiScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Beranda"),
            selectedColor: primaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.list_rounded),
            title: Text("Aktivitas"),
            selectedColor: secondaryColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.notifications),
            title: Text("Notifikasi"),
            selectedColor: accentColor,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profil"),
            selectedColor: profileColor,
          ),
        ],
      ),
    );
  }
}
