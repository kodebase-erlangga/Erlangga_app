import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../secondScreen/settingsScreen.dart';
import '../beranda/cardview_search.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()), // Hapus 'const'
            );
          },
        ),
        title: const Text("Bantuan"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Card
            Card(
              color: const Color(0xFF343434),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Agar semua elemen sejajar vertikal
                  children: [
                    // Text Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Hai, lagi butuh bantuan apa nih?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Silahkan pilih topik dibawah ini",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 16), // Jarak antara elemen profil dan pencarian
                          CardViewSearch(),
                        ],
                      ),
                    ),
                    // Icon Section
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center, // Pusatkan teks dan ikon
                    //   children: [
                    //     SvgPicture.asset(
                    //       'assets/icons/ask.svg',
                    //       width: 40,
                    //       height: 40,
                    //     ),
                    //     const SizedBox(height: 4), // Atur jarak kecil antara ikon dan teks
                    //     const Text(
                    //       "Laporan",
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20), // Spacing between cards

            // Title "Topik Popular"
            const Text(
              "Topik Popular",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16), // Spacing between title and cards

            // Cards Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2, // 2 cards per row
              crossAxisSpacing: 12, // Spacing between columns
              mainAxisSpacing: 12, // Spacing between rows
              childAspectRatio: 3.5, // Adjust ratio to make rectangular
              children: [
                _buildCard(
                  color: const Color(0xFFFAF7F0), // Light Blue
                  iconPath: 'assets/icons/keamanan.svg',
                  text: "Keamanan",
                ),
                _buildCard(
                  color: const Color(0xFFFAF7F0), // Light Green
                  iconPath: 'assets/icons/credit_card.svg',
                  text: "Pembayaran",
                ),
                _buildCard(
                  color: const Color(0xFFFAF7F0), // Light Orange
                  iconPath: 'assets/icons/promo.svg',
                  text: "Promo",
                ),
                _buildCard(
                  color: const Color(0xFFFAF7F0), // Light Teal
                  iconPath: 'assets/icons/transaksi.svg',
                  text: "Transaksi",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to create individual card
  Widget _buildCard({
    required Color color,
    required String iconPath,
    required String text,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: [
            // Icon
            SvgPicture.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10), // Spacing between icon and text
            // Text
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
