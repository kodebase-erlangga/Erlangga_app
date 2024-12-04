import 'package:flutter/material.dart';
import 'package:erl_app/view/notifikasiScreen/appbarNotifikasi.dart';
import 'package:erl_app/view/notifikasiScreen/highlight.dart';
import 'package:erl_app/view/notifikasiScreen/datecard.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarNotifikasi(),
      body: DateCards(),
      backgroundColor: Colors.grey[300],
    );
  }
}