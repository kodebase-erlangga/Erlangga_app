import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:erl_app/database/db_helper.dart';
import 'cardview_profile.dart';

class CardViewValidasiProfile extends StatefulWidget {
  @override
  _CardViewValidasiProfileState createState() =>
      _CardViewValidasiProfileState();
}

class _CardViewValidasiProfileState extends State<CardViewValidasiProfile> {
  String? _userName;
  String? _profilePicUrl;

  @override
  void initState() {
    super.initState();
    _validateUser();
  }

  Future<void> _validateUser() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      // Jika login menggunakan Google
      setState(() {
        _userName = firebaseUser.displayName?.split(' ').first ?? "User";
        _profilePicUrl = firebaseUser.photoURL;
      });
    } else {
      // Jika login menggunakan database lokal
      final db = await DBHelper.instance.database; // Tunggu instance Database
      final loggedInUser = await db.query(
        'users',
        where: 'isLoggedIn = ?',
        whereArgs: [1],
        limit: 1,
      );
      if (loggedInUser.isNotEmpty) {
        setState(() {
          _userName = loggedInUser.first['firstName'] as String? ?? "User";
        });
      } else {
        setState(() {
          _userName = "Guest";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _userName == null
        ? CircularProgressIndicator() // Tampilkan loader jika validasi belum selesai
        : CardViewProfile(
          userName: _userName!,
          profilePicUrl: _profilePicUrl,);
        
  }
}
