import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Highlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          buildHighlightCard(
            context,
            "assets/icons/speaker.svg",
            "Perbarui aplikasi Anda untuk fitur terbaru.",
          ),
          buildHighlightCard(
            context,
            "assets/icons/speaker.svg",
            "Jangan lewatkan promo eksklusif minggu ini!",
          ),
          buildHighlightCard(
            context,
            "assets/icons/speaker.svg",
            "Penting: Jadwal maintenance server besok.",
          ),
        ],
      ),
    );
  }

  Widget buildHighlightCard(BuildContext context, String iconPath, String text) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(right: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 40,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
