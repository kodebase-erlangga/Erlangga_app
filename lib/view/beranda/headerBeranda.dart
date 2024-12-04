import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderBeranda extends StatelessWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onSignOutPressed;

  const HeaderBeranda({
    Key? key,
    required this.onSettingsPressed,
    required this.onSignOutPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Row(
            children: [
              Image.asset(
                'assets/Images/superApp_cropped.png',
                height: 70, // Adjust logo size
                width: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
            ],
          ),

          // Icons
          Row(
            children: [
              // Settings Icon
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  height: 24, // Adjust icon size
                ),
                onPressed: onSettingsPressed,
              ),
              const SizedBox(width: 8), // Space between icons

              // Sign Out Icon
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/signOut.svg',
                  height: 24, // Adjust icon size
                ),
                onPressed: onSignOutPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
