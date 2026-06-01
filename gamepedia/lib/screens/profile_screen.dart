import 'package:flutter/material.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:gamepedia/screens/setting_screen.dart';
import 'package:gamepedia/widgets/profile_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/favorites_service.dart';

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
    if (signedIn && savedUsername.isNotEmpty) {
      try {
        final favs = await FavoritesService.getFavoritesOnce(savedUsername);
        count = favs.length;
      } catch (_) {
        count = prefs.getKeys().where((key) {
          return key.startsWith('favorite_') && prefs.getBool(key) == true;
        }).length;
      }
    } else {
      count = prefs.getKeys().where((key) {
        return key.startsWith('favorite_') && prefs.getBool(key) == true;
      }).length;
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
    await prefs.setBool('isAdmin', false);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                          child: Text(
                            AppLocalizations.of(context)!.appName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                      tooltip: AppLocalizations.of(context)!.settings,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.of(context)!.discoverTagline,
                  style: const TextStyle(
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
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF1A2847),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF6D5DF6),
                                Color(0xFF9F7BFF),
                                Color(0xFF1B1F4A),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(1.5),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0F122A),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isSignedIn
                                      ? (username.isNotEmpty
                                            ? username
                                            : AppLocalizations.of(
                                                context,
                                              )!.userLabelUser)
                                      : AppLocalizations.of(
                                          context,
                                        )!.userLabelGuest,
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              child: Text(
                                                AppLocalizations.of(
                                                  context,
                                                )!.register,
                                                style: const TextStyle(
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                              child: Text(
                                                AppLocalizations.of(
                                                  context,
                                                )!.login,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Quicksand',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.welcomeMessage,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
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
                        label: AppLocalizations.of(context)!.editProfile,
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
                        label: AppLocalizations.of(context)!.wishlist,
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
                        label: AppLocalizations.of(
                          context,
                        )!.termsOfServiceShort,
                        value: '',
                        showEditIcon: false,
                        iconColor: Color(0xFFd1d5db),
                        iconBackgroundColor: Colors.white.withOpacity(0.1),
                        iconBackgroundHoverColor: Colors.white.withOpacity(
                          0.15,
                        ),
                        isSignedIn: isSignedIn,
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
                      label: Text(
                        AppLocalizations.of(context)!.logout,
                        style: const TextStyle(
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
                if (isSignedIn)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          final uname = prefs.getString('username') ?? 'guest';
                          await FavoritesService.migrateLocalFavoritesFromPrefs(
                            uname,
                          );
                          final favs = await FavoritesService.getFavoritesOnce(
                            uname,
                          );
                          setState(() {
                            favoriteGameCount = favs.length;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)!.favoritesMigrated,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.migrateFavorites,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.copyright,
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
