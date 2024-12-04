import 'package:flutter/material.dart';

class AppBarSettings extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;

  const AppBarSettings({Key? key, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPressed, // Callback for back button
      ),
      title: const Text(
        'Pengaturan',
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Change the AppBar color if needed
      elevation: 2, // Adjust the elevation for shadow effect
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
