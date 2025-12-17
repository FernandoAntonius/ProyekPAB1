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
    _loadFavoritesStatus();
  }

  // ================= AUTH =================
  void _checkSignInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isSignedIn = prefs.getBool("isSignedIn") ?? false;
    });
  }

  void _loadFavoritesStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite =
          prefs.getBool("favorite_${widget.game.title}") ?? false;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();

    if (!isSignedIn) {
      Navigator.pushNamed(context, "/signin");
      return;
    }

    setState(() {
      isFavorite = !isFavorite;
    });

    prefs.setBool("favorite_${widget.game.title}", isFavorite);
  }

  // ================= UI HELPERS =================
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

          // MINIMUM
          const Text(
            "Minimum",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          if (sysReq.containsKey('minimum'))
            ...sysReq['minimum']!.entries.map(
              (e) => Text(
                "• ${e.key}: ${e.value}",
                style: const TextStyle(color: Colors.white70),
              ),
            ),

          const SizedBox(height: 12),

          // RECOMMENDED
          const Text(
            "Recommended",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          if (sysReq.containsKey('maximum'))
            ...sysReq['maximum']!.entries.map(
              (e) => Text(
                "• ${e.key}: ${e.value}",
                style: const TextStyle(color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }

  // ================= BUILD =================
  @override
<<<<<<< Updated upstream
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
    bool saved = prefs.getBool("favorite_${widget.game.title}") ?? false;

    setState(() {
      isFavorite = saved;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    if (!isSignedIn) {
      Navigator.pushNamed(context, "/login");
      return;
    }

    bool newStatus = !isFavorite;
    prefs.setBool("favorite_${widget.game.title}", newStatus);

    setState(() {
      isFavorite = newStatus;
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
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
=======
>>>>>>> Stashed changes
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
<<<<<<< Updated upstream
            // MAIN IMAGE
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
=======
            // IMAGE
            Padding(
              padding: const EdgeInsets.all(8),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
            const SizedBox(height: 16),
            //TITLE, DEVELOPER, FAVORITE, RATING
=======

            // TITLE + RATING + FAVORITE
>>>>>>> Stashed changes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< Updated upstream
                  // TITLE DAN DEVELOPER DI KIRI
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: List.generate(widget.game.avaible.length, (index) {
                  return buildTag(widget.game.avaible[index]);
                }),
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
                  children: List.generate(widget.game.genre.length, (index) {
                    return buildTag(widget.game.genre[index]);
                  }),
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
=======
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
>>>>>>> Stashed changes
                        ),
                        errorWidget: (context, url, err) =>
                            const Icon(Icons.error, color: Colors.red),
                      ),
<<<<<<< Updated upstream
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildSystemRequirements(widget.game),
            const SizedBox(height: 10),
=======
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildSystemRequirements(widget.game),
            const SizedBox(height: 20),
>>>>>>> Stashed changes
          ],
        ),
      ),
    );
  }
}
