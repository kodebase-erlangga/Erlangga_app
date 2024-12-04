import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'pengaturanapk.dart';
import 'bantuan.dart';

class CardViewApkNHelp extends StatelessWidget {
  const CardViewApkNHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          // Pengaturan Aplikasi Row
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 24,
              height: 24,
            ),
            title: const Text(
              "Pengaturan Aplikasi",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PengaturanApk()),
              );
            },
          ),
          const Divider(height: 1, thickness: 1),

          // Bantuan Row
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/help.svg',
              width: 24,
              height: 24,
            ),
            title: const Text(
              "Bantuan",
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bantuan()),
              );
            },
          ),
        ],
      ),
    );
  }
}
