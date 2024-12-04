import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 

class Detailprofile extends StatelessWidget {
  final String userName;
  final String email;
  final String? profilePicUrl;

  const Detailprofile({
    required this.userName,
    required this.email,
    this.profilePicUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profil dan Teks
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Foto profil
                    ClipOval(
                      child: profilePicUrl != null
                          ? Image.network(
                              profilePicUrl!, // URL foto profil dari Google
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/Images/profile_pic.png', // Avatar default
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(width: 12), // Jarak antara foto dan teks

                    // Kolom Teks
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Teks salam pengguna
                        Text(
                          "$userName",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Edit profile",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
