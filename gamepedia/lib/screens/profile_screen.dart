import 'package:flutter/material.dart';
import 'package:gamepedia/widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullname = '';
  String userName = '';
  int favoriteCandiCount = 0;
  late Color iconColor;

  // TODO: 5. Implementasi fungsi Sign In
  void SignIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // TODO: 6. Implementasi fungsi Sign Out
  void SignOut() {
    setState(() {
      isSignedIn = false; // Pastikan state diupdate
    });
    Navigator.pushNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F22),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),

            /// --- HEADER ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "GamePedia",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Icon(
                    Icons.sports_esports,
                    color: Colors.blueAccent[100],
                    size: 32,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // TODO: 2. Buat bagian ProfileHeader yang berisi gambar
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20), // Sesuaikan padding agar lebih rapi
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/placeholder_image.png'),
                            ),
                          ),
                          if (isSignedIn)
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50]),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // TODO: 3. Buat bagian ProfileInfo yang berisi info profile
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity, // Gunakan double.infinity untuk responsive, bukan fixed 500
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Tambah padding vertikal
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), // Tambah border radius untuk lebih rapi
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.shade900,
                          Colors.deepPurple.shade900
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileInfoItem(
                          icon: Icons.person,
                          label: 'Name', // Sesuaikan label agar lebih jelas
                          value: fullname.isNotEmpty ? fullname : 'Not set', // Gunakan fullname untuk name
                          showEditIcon: isSignedIn,
                          onEditPressed: () {
                            debugPrint('Icon Edit Ditekan ...');
                          },
                          iconColor: Colors.white,
                        ),
                        Divider(color: Colors.deepPurple[100]),
                        const SizedBox(height: 15),
                        ProfileInfoItem(
                          icon: Icons.favorite_border_rounded,
                          label: 'Wishlist', // Perbaiki typo 'Whislist' menjadi 'Wishlist'
                          value: favoriteCandiCount > 0 ? '$favoriteCandiCount items' : 'No items', // Sesuaikan value untuk wishlist
                          showEditIcon: false, // Tidak perlu edit icon di sini
                          iconColor: Colors.blue,
                        ),
                        Divider(color: Colors.deepPurple[100]),
                        const SizedBox(height: 15),
                        ProfileInfoItem(
                          icon: Icons.settings,
                          label: 'Terms Of Service', // Label ini mungkin salah, tapi biarkan jika sesuai requirement
                          value: '', // Kosongkan value jika tidak relevan, atau sesuaikan
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                  ),

                  // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                  const SizedBox(height: 200),
                  isSignedIn
                      ? OutlinedButton.icon( // Gunakan OutlinedButton.icon untuk tombol transparan dengan outline merah dan ikon
                          onPressed: SignOut,
                          icon: const Icon(Icons.logout, color: Colors.redAccent), // Ikon pintu keluar (logout)
                          label: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.redAccent, fontSize: 16),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.redAccent, width: 2), // Line merah
                            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                            shape: RoundedRectangleBorder( // Bentuk kotak tumpul
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: SignIn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                            shape: RoundedRectangleBorder( // Bentuk kotak tumpul
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}