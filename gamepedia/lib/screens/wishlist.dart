import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:gamepedia/models/game.dart';

class EmptyWishlist extends StatelessWidget {
  const EmptyWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(height: 10),
        Text(
          "Your wishlist is empty :(",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Start adding games you're interested in!",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class WishlistHeader extends StatelessWidget {
  const WishlistHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
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
          "0 games saved.",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 13,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class WishlistScreen extends StatelessWidget {
  final List<Game> wishlist;
  const WishlistScreen({super.key, required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      

      body: wishlist.isEmpty
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  WishlistHeader(),
                  SizedBox(height: 24), 
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: EmptyWishlist(),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const WishlistHeader(),
                Expanded(child: WishlistList(wishlist: wishlist)),
              ],
            ),
    );
  }
}

class WishlistList extends StatelessWidget {
  final List<Game> wishlist;
  const WishlistList({super.key, required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: wishlist.length,
      itemBuilder: (context, index) {
        final game = wishlist[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF8E2082), Color(0xFF342860)],
            ),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(game.imageAssets),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 10, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            game.rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 6),
                    // GENRE
                    SizedBox(
                      height: 25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: game.genre.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF2C3C8B), Color(0xFF8366ED)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              game.genre[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    // DEVICES
                    SizedBox(
                      height: 22,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: game.avaible.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.white30),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              game.avaible[index],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                                height: 1.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.white70,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          game.releaseDate.toString().split(' ')[0],
                          style: const TextStyle(color: Colors.white70),
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite, color: Colors.pink),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
