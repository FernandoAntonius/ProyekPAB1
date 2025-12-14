import 'package:flutter/material.dart';
import 'package:gamepedia/models/game.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/game_data.dart';

class WishlistScreen extends StatefulWidget {
  final List<Game> wishlist;
  WishlistScreen({super.key, required this.wishlist});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Game> favoriteGames = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteGames();
  }

  void _loadFavoriteGames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Game> favorites = [];
    for (var game in gameList) {
      bool isFav = prefs.getBool('favorite_${game.title}') ?? false;
      if (isFav) {
        favorites.add(game);
      }
    }
    setState(() {
      favoriteGames = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: Color(0xFF6A5AF9),
        ),
        title: const Text(
          'Wishlist',
          style: TextStyle(
            color: Color(0xFF6A5AF9),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('images/console.png', height: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Image.asset('images/wishlist.png', width: 90),
            const SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFF3737), Color(0xFFFF7BC4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
            ),
            const SizedBox(height: 8),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFFFF3737), Color(0xFFFF7BC4)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: const Text(
                "Wishlist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${favoriteGames.length} games saved.",
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 13,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
