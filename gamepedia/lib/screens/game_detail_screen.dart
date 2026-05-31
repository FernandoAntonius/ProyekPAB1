import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/favorites_service.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/models/review.dart';
import 'package:gamepedia/screens/add_review_screen.dart';
import 'package:gamepedia/screens/all_review_screen.dart';
import 'package:gamepedia/widgets/info_card.dart';
import 'package:gamepedia/screens/by_device.dart/windows.dart';
import 'package:gamepedia/screens/by_device.dart/android.dart';
import 'package:gamepedia/screens/by_device.dart/ios.dart';
import 'package:gamepedia/screens/by_device.dart/playstation.dart';
import 'package:gamepedia/screens/by_device.dart/xbox.dart';
import 'package:gamepedia/screens/by_device.dart/nintendo_switch.dart';
import 'package:gamepedia/screens/by_device.dart/linux.dart';
import 'package:gamepedia/screens/by_device.dart/macos.dart';
import 'package:gamepedia/screens/by_genre.dart/platformer.dart';
import 'package:gamepedia/screens/by_genre.dart/shooter.dart';
import 'package:gamepedia/screens/by_genre.dart/strategy.dart';
import 'package:gamepedia/screens/by_genre.dart/role_playing.dart';
import 'package:gamepedia/screens/by_genre.dart/puzzle.dart';
import 'package:gamepedia/screens/by_genre.dart/adventure.dart';

class GameDetailScreen extends StatefulWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  //SYSTEM REQUIRENMENTS
  Widget _buildSystemRequirements(Game game) {
    final sysReq = game.systemRequirements;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E2150), Color(0xFF15183C)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "System Requirements",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Minimum Requirements
          const Text(
            "Minimum",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          if (sysReq.containsKey('minimum'))
            ...sysReq['minimum']!.entries.map(
              (entry) => Text(
                "• ${entry.key}: ${entry.value}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontFamily: "Quicksand",
                ),
              ),
            ),
          //Maximum Requirenments
          const SizedBox(height: 12),
          const Text(
            "Recommended",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
            ),
          ),
          const SizedBox(height: 6),
          if (sysReq.containsKey('maximum'))
            ...sysReq['maximum']!.entries.map(
              (entry) => Text(
                "• ${entry.key}: ${entry.value}",
                style: const TextStyle(color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
    _loadFavoritesStatus();
  }

  void _checkSignInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isSignedIn = prefs.getBool("isSignedIn") ?? false;
    setState(() {});
  }

  void _loadFavoritesStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isSignedIn = prefs.getBool("isSignedIn") ?? false;

    if (isSignedIn) {
      final username = prefs.getString('username') ?? 'guest';
      final favs = await FavoritesService.getFavoritesOnce(username);
      setState(() {
        isFavorite = favs.contains(widget.game.title);
      });
    } else {
      final saved = prefs.getBool("favorite_${widget.game.title}") ?? false;
      setState(() {
        isFavorite = saved;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    if (!isSignedIn) {
      Navigator.pushNamed(context, "/login");
      return;
    }

    final username = prefs.getString('username') ?? 'guest';
    if (isFavorite) {
      await FavoritesService.removeFavorite(username, widget.game.title);
      await prefs.setBool("favorite_${widget.game.title}", false);
      setState(() {
        isFavorite = false;
      });
    } else {
      await FavoritesService.addFavorite(username, widget.game.title);
      await prefs.setBool("favorite_${widget.game.title}", true);
      setState(() {
        isFavorite = true;
      });
    }
  }

  void _navigateToDevice(String platform) {
    final p = platform.toLowerCase();
    if (p.contains('windows')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WindowsScreen()),
      );
    } else if (p.contains('android')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AndroidScreen()),
      );
    } else if (p.contains('ios') ||
        p.contains('iphone') ||
        p.contains('ipad')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const IOSScreen()),
      );
    } else if (p.contains('playstation')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PlayStationScreen()),
      );
    } else if (p.contains('xbox')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const XboxScreen()),
      );
    } else if (p.contains('nintendo') || p.contains('switch')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const NintendoSwitchScreen()),
      );
    } else if (p.contains('linux')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LinuxScreen()),
      );
    } else if (p.contains('mac') ||
        p.contains('macos') ||
        p.contains('mac os')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MacOSSCreen()),
      );
    }
  }

  void _navigateToGenre(String genre) {
    final g = genre.toLowerCase();
    if (g.contains('platform')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PlatformerScreen()),
      );
    } else if (g.contains('shooter')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ShooterScreen()),
      );
    } else if (g.contains('strategy')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const StrategyScreen()),
      );
    } else if (g.contains('role') ||
        g.contains('rpg') ||
        g.contains('role-playing')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const RolePlayingScreen()),
      );
    } else if (g.contains('puzzle')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PuzzleScreen()),
      );
    } else if (g.contains('adventure')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AdventureScreen()),
      );
    }
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(Review review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF161A3A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  review.author,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 14,
                color: index < review.rating
                    ? Colors.amber
                    : Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            review.content,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AddReviewScreen(fixedGameName: widget.game.title),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF6A5AF9),
                ),
                child: const Text('Add review'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AllReviewScreen(gameTitle: widget.game.title),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF6A5AF9),
                ),
                child: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('reviews')
                .where('gameName', isEqualTo: widget.game.title)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Text(
                  'No reviews yet',
                  style: TextStyle(color: Colors.grey.shade400),
                );
              }

              final reviews =
                  snapshot.data!.docs
                      .map((doc) => Review.fromFirestore(doc.data()))
                      .toList()
                    ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

              return Column(
                children: reviews
                    .take(3)
                    .map((review) => _buildReviewCard(review))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1126),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1126),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ShaderMask(
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MAIN IMAGE
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.game.imageAssets,
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            //TITLE, DEVELOPER, FAVORITE, RATING
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE DAN DEVELOPER DI KIRI
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.game.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.game.developer,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // RATING DAN FAVORITE
                  Row(
                    children: [
                      // RATING
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            widget.game.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // FAVORITE BUTTON
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // RELEASE DATE & PRICE CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildInfoCard(
                    icon: Icons.calendar_month,
                    title: "Release Date",
                    value: widget.game.releaseDate.toString().split(' ')[0],
                  ),
                  const SizedBox(width: 10),
                  buildInfoCard(
                    icon: Icons.attach_money,
                    title: "Price",
                    value: "\$${widget.game.price}",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // AVAILABLE ON
            buildSectionTitle("Available On"),
            SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    ...widget.game.device
                        .expand((item) => item.split(',').map((s) => s.trim()))
                        .map((platform) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: buildTag(
                              platform,
                              onTap: () => _navigateToDevice(platform),
                            ),
                          );
                        })
                        .toList(),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // GENRE
            buildSectionTitle("Genre"),
            SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    ...widget.game.genre
                        .expand((item) => item.split(',').map((s) => s.trim()))
                        .map((genre) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: buildTag(
                              genre,
                              onTap: () => _navigateToGenre(genre),
                            ),
                          );
                        })
                        .toList(),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ABOUT
            buildSectionTitle("About this game"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.game.description,
                style: const TextStyle(color: Colors.white70, height: 1.4),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            // SCREENSHOTS
            buildSectionTitle("Screenshots"),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.game.screenShots.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: widget.game.screenShots[index],
                        width: 160,
                        height: 120,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 160,
                          height: 120,
                          color: Colors.white12,
                        ),
                        errorWidget: (context, url, err) =>
                            const Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildReviewSection(context),
            const SizedBox(height: 20),
            _buildSystemRequirements(widget.game),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
