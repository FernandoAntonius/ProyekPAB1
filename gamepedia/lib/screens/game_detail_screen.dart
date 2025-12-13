import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/widgets/info_card.dart';
import 'package:gamepedia/widgets/wishlist_provider.dart';

class GameDetailScreen extends StatelessWidget {
  final Game game;
  const GameDetailScreen({super.key, required this.game});

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
    final wishlist = context.watch<WishlistProvider>();
    final isFav = wishlist.isFavorite(game);

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
                  game.imageAssets,
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
                          game.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          game.developer,
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
                        game.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          wishlist.toggleFavorite(game);
                        },
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.white,
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
                    value: game.releaseDate.toString().split(' ')[0],
                  ),
                  const SizedBox(width: 10),
                  buildInfoCard(
                    icon: Icons.attach_money,
                    title: "Price",
                    value: "\$${game.price}",
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
                spacing: 8,
                runSpacing: 8,
                children: game.avaible.map((e) => buildTag(e)).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // GENRE
            buildSectionTitle("Genre"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: game.genre.map((e) => buildTag(e)).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // ABOUT
            buildSectionTitle("About this game"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                game.description,
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
                itemCount: game.screenShots.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: game.screenShots[index],
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

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
