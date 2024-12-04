import 'package:flutter/material.dart';
import 'package:erl_app/view/aktivitasScreen/tablayoutScreen/terjadwal.dart';
import 'package:erl_app/view/aktivitasScreen/tablayoutScreen/riwayat.dart';
import 'package:erl_app/view/aktivitasScreen/tablayoutScreen/proses.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Proses'),
              Tab(text: 'Terjadwal'),
              Tab(text: 'Riwayat'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ProsesTab(), // Proses tab
                TerjadwalTab(), // Terjadwal tab
                RiwayatTab(), // Riwayat tab
              ],
            ),
          ),
        ],
      ),
    );
  }
}
