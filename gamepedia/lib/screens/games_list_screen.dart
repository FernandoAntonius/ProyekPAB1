import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/game_detail_screen.dart';

class GamesListScreen extends StatelessWidget {
  final String title;
  final Stream<List<Game>> gamesStream;
  final String emptyMessage;

  const GamesListScreen({
    super.key,
    required this.title,
    required this.gamesStream,
    required this.emptyMessage,
  });

  Widget _buildGameImage(String imageAssets) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: imageAssets.startsWith('http')
          ? Image.network(
              imageAssets,
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            )
          : Image.asset(imageAssets, width: 80, height: 120, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1126),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xFF6A5AF9),
        ),
        title: Text(
          title,
          style: const TextStyle(
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
      body: SafeArea(
        child: StreamBuilder<List<Game>>(
          stream: gamesStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Unable to load games.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final games = snapshot.data ?? [];
            if (games.isEmpty) {
              return Center(
                child: Text(
                  emptyMessage,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameDetailScreen(game: game),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C3A),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          _buildGameImage(game.imageAssets),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  game.description,
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        game.genre.isNotEmpty
                                            ? game.genre.first
                                            : '',
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
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
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
