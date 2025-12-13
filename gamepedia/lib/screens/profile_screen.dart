import 'package:flutter/material.dart';
import 'package:gamepedia/widgets/profile_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSignedIn = false;
  String username = '';
  int favoriteGameCount = 0;
  late Color iconColor;

  @override
  void initState() {
    super.initState();
    _loadSignedInStatus();
  }

  void _loadSignedInStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool signedIn = prefs.getBool('isSignedIn') ?? false;
    final String savedUsername = prefs.getString('username') ?? '';

    setState(() {
      isSignedIn = signedIn;
      username = savedUsername;
    });
  }

  void login() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    setState(() {
      isSignedIn = false;
    });
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        const LinearGradient(
                          colors: [
                            Color(0xFF3A3FF2),
                            Color(0xFF7754F4),
                            Color(0xFF965FF5),
                          ],
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "GamePedia",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Quicksand',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset('images/console.png', height: 50),
                ],
              ),
              SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('images/console.png'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.deepPurple[50],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isSignedIn
                                ? (username.isNotEmpty ? username : 'User')
                                : 'Guest',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.white30,
                                      width: 1,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.white30,
                                      width: 1,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Quicksand',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF190D84), Color(0xFF20143D)],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileInfoItem(
                      icon: Icons.person,
                      label: 'Edit Profile',
                      value: '',
                      showEditIcon: false,
                      iconColor: Colors.white,
                      isSignedIn: isSignedIn,
                        navigateTo: '/edit_profile',
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.deepPurple[100]),
                    const SizedBox(height: 20),
                    ProfileInfoItem(
                      icon: Icons.favorite_border_rounded,
                      label: 'Wishlist',
                      value: '',
                      showEditIcon: false,
                      iconColor: Colors.red,
                      isSignedIn: isSignedIn,
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.deepPurple[100]),
                    const SizedBox(height: 20),
                    ProfileInfoItem(
                      icon: Icons.settings,
                      label: 'Terms of Service',
                      value: '',
                      iconColor: Colors.white,
                      navigateTo: '/terms',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              if (isSignedIn)
                OutlinedButton.icon(
                  onPressed: logout,
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red, width: 1.5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Text(
                '© GamePedia 2025',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 12,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
