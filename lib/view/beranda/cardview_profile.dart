import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cardview_search.dart'; // Pastikan Anda memiliki file ini untuk widget pencarian

class CardViewProfile extends StatelessWidget {
  final String userName;
  final String? profilePicUrl;

  const CardViewProfile({
    required this.userName,
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
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                          "Hi, $userName",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4), // Jarak antara baris
                        const Text(
                          "Member Erlangga",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Logo Erlangga
                Image.asset(
                  'assets/Images/superApp_cropped.png',
                  height: 60, // Sesuaikan ukuran logo
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(
                height: 16), // Jarak antara elemen profil dan pencarian
            CardViewSearch(), // Menambahkan widget pencarian
          ],
        ),
      ),
    );
  }
}
