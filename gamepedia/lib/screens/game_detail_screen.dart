import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/widgets/info_card.dart';

class GameDetailScreen extends StatefulWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
    _loadFavoriteStatus();
  }

  void _checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool signedIn = prefs.getBool('isSignedIn') ?? false;
    setState(() {
      isSignedIn = signedIn;
    });
  }

  void _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool favorite = prefs.getBool('favorite_${widget.game.title}') ?? false;
    setState(() {
      isFavorite = favorite;
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!isSignedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return;
    }
    bool favoriteStatus = !isFavorite;
    prefs.setBool('favorite_${widget.game.title}', favoriteStatus);
    setState(() {
      isFavorite = favoriteStatus;
    });
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

            // TITLE, DEVELOPER, RATING, FAVORITE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE & DEVELOPER
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

                  // RATING & FAVORITE
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        widget.game.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          _toggleFavorite();
                        },
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

            // RELEASE DATE & PRICE
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft, // Pastikan align ke kiri
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.game.avaible.map((e) => buildTag(e)).toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // GENRE
            buildSectionTitle("Genre"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.game.genre.map((e) => buildTag(e)).toList(),
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

            _buildSystemRequirements(widget.game),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

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
                  fontFamily: "Quicksand"
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
              fontFamily: "Quicksand"
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
}