import 'package:flutter/material.dart';
import 'package:gamepedia/widgets/profile_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/game_data.dart';

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

    int count = 0;
    for (var game in gameList) {
      bool isFav = prefs.getBool('favorite_${game.title}') ?? false;
      if (isFav) {
        count++;
      }
    }

    setState(() {
      isSignedIn = signedIn;
      username = savedUsername;
      favoriteGameCount = count;
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
      backgroundColor: const Color(0xFF0E1126),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(0xFF3A3FF2),
                          Color(0xFF7754F4),
                          Color(0xFF965FF5),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Image.asset(
                        'images/console.png',
                        height: 40,
                        width: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF1124A5), Color(0xFFB923FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Text(
                        "GamePedia",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "Discover Amazing Games",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 16),
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
                            !isSignedIn
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/register',
                                            );
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
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                            Navigator.pushNamed(
                                              context,
                                              '/login',
                                            );
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
                                              borderRadius:
                                                  BorderRadius.circular(6),
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
                                  )
                                : SizedBox(height: 0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1a1a3e), Color(0xFF0f0f2a)],
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 39, 0, 82),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileInfoItem(
                        icon: Icons.person_outline,
                        label: 'Edit Profile',
                        value: '',
                        showEditIcon: false,
                        iconColor: Color(0xFF6366f1),
                        iconBackgroundColor: Color(0xFF6366f1).withOpacity(0.1),
                        iconBackgroundHoverColor: Color(
                          0xFF6366f1,
                        ).withOpacity(0.2),
                        isSignedIn: isSignedIn,
                        navigateTo: '/edit_profile',
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      ProfileInfoItem(
                        icon: Icons.favorite_outline,
                        label: 'Wishlist',
                        value: '',
                        showEditIcon: false,
                        iconColor: Color(0xFFec4899),
                        iconBackgroundColor: Color(0xFFec4899).withOpacity(0.1),
                        iconBackgroundHoverColor: Color(
                          0xFFec4899,
                        ).withOpacity(0.2),
                        isSignedIn: isSignedIn,
                        navigateTo: '/wishlist',
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      ProfileInfoItem(
                        icon: Icons.settings_outlined,
                        label: 'Terms of Service',
                        value: '',
                        showEditIcon: false,
                        iconColor: Color(0xFFd1d5db),
                        iconBackgroundColor: Colors.white.withOpacity(0.1),
                        iconBackgroundHoverColor: Colors.white.withOpacity(
                          0.15,
                        ),
                        navigateTo: '/terms',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                if (isSignedIn)
                  Center(
                    child: OutlinedButton.icon(
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
                  ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    '© GamePedia 2025',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
