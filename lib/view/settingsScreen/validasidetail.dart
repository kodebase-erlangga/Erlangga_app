import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:erl_app/database/db_helper.dart';
import 'detailprofile.dart';

class Validasidetail extends StatefulWidget {
  @override
  _Validasidetail createState() => _Validasidetail();
}

class _Validasidetail extends State<Validasidetail> {
  String? _userName;
  String? _email;
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
        _email = firebaseUser.email ?? "No email";
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
          _email = loggedInUser.first['email'] as String? ?? "No email";
        });
      } else {
        setState(() {
          _userName = "Guest";
          _email = "No email";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _userName == null
        ? CircularProgressIndicator() // Tampilkan loader jika validasi belum selesai
        : Detailprofile(
            userName: _userName!,
            profilePicUrl: _profilePicUrl,
            email: _email!);
  }
}
