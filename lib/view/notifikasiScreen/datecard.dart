import 'package:flutter/material.dart';

class DateCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildDateCard(
          date: "25 November 2024",
          logoPath: "assets/Images/superApp.png",
          text: "Pengumuman penting mengenai jadwal ujian.",
        ),
        buildDateCard(
          date: "24 November 2024",
          logoPath: "assets/Images/superApp.png",
          text: "Update aplikasi terbaru telah tersedia.",
        ),
        buildDateCard(
          date: "23 November 2024",
          logoPath: "assets/Images/superApp.png",
          text: "Jangan lewatkan webinar gratis minggu depan!",
        ),
      ],
    );
  }

  Widget buildDateCard({
    required String date,
    required String logoPath,
    required String text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tanggal di atas card
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
        ),
        // Card berisi logo dan tulisan
        Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Logo
                Image.asset(
                  logoPath,
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 16),
                // Tulisan
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
