import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:erl_app/view/aktivitasScreen/appbarAktivitas.dart';
import 'package:flutter/material.dart';
import 'package:erl_app/view/aktivitasScreen/appbarAktivitas.dart';
import 'package:erl_app/view/aktivitasScreen/tablayout.dart';

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarAktivitas(),
      body: TabLayout(),
      backgroundColor:Colors.grey[300],
    );
  }
}

