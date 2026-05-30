import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/by_device.dart/android.dart';
import 'package:gamepedia/screens/by_device.dart/ios.dart';
import 'package:gamepedia/screens/by_device.dart/linux.dart';
import 'package:gamepedia/screens/by_device.dart/macos.dart';
import 'package:gamepedia/screens/by_device.dart/nintendo_switch.dart';
import 'package:gamepedia/screens/by_device.dart/playstation.dart';
import 'package:gamepedia/screens/by_device.dart/windows.dart';
import 'package:gamepedia/screens/by_device.dart/xbox.dart';
import 'package:gamepedia/screens/by_genre.dart/adventure.dart';
import 'package:gamepedia/screens/by_genre.dart/platformer.dart';
import 'package:gamepedia/screens/by_genre.dart/puzzle.dart';
import 'package:gamepedia/screens/by_genre.dart/role_playing.dart';
import 'package:gamepedia/screens/by_genre.dart/shooter.dart';
import 'package:gamepedia/screens/by_genre.dart/strategy.dart';
import 'package:gamepedia/screens/game_detail_screen.dart';
import 'package:gamepedia/screens/new_release.dart';
import 'package:gamepedia/screens/popular_game.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

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
                const Text(
                  "Discover Amazing Games",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 16),

                // SEARCH BAR
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Search games...",
                      hintStyle: TextStyle(color: Color(0xFFDCA7FF)),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // POPULAR GAMES SLIDER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.bar_chart_rounded,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Popular Games",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PopularGamesScreen(),
                        ),
                      ),
                      child: const Text(
                        "Show all",
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1C3A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: StreamBuilder<List<Game>>(
                    stream: GameRepository.streamPopularGames(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            'Unable to load popular games.',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final popularGames = snapshot.data ?? [];
                      if (popularGames.isEmpty) {
                        return const Center(
                          child: Text(
                            'No popular games available.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularGames.length,
                        itemBuilder: (context, index) {
                          final game = popularGames[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => GameDetailScreen(game: game),
                              ),
                            ),
                            child: Container(
                              width: 250,
                              margin: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: game.imageAssets.startsWith('http')
                                    ? Image.network(
                                        game.imageAssets,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        game.imageAssets,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // SEARCHED / ALL GAMES LIST
                StreamBuilder<List<Game>>(
                  stream: GameRepository.streamAllGames(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Error loading games.',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final firebaseGames = snapshot.data ?? [];
                    final filteredGames = firebaseGames
                        .where(
                          (g) => g.title.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ),
                        )
                        .toList();

                    if (filteredGames.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text(
                            'No games found.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = filteredGames[index];
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: game.imageAssets.startsWith('http')
                                      ? Image.network(
                                          game.imageAssets,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          game.imageAssets,
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        game.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),

                // BROWSE BY GENRE
                const Row(
                  children: [
                    Icon(Icons.grid_view_rounded, color: Colors.cyanAccent),
                    SizedBox(width: 6),
                    Text(
                      "Browse by Genre",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildGenreCard(
                      context,
                      "Adventure",
                      Icons.explore_rounded,
                      const AdventureScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Role-playing",
                      Icons.auto_stories_rounded,
                      const RolePlayingScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Shooter",
                      Icons.gps_fixed_rounded,
                      const ShooterScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Platformer",
                      Icons.videogame_asset_rounded,
                      const PlatformerScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Puzzle",
                      Icons.extension_rounded,
                      const PuzzleScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Strategy",
                      Icons.account_tree_rounded,
                      const StrategyScreen(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // BROWSE BY DEVICE
                const Row(
                  children: [
                    Icon(Icons.device_hub, color: Colors.cyanAccent),
                    SizedBox(width: 6),
                    Text(
                      "Browse by Device",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildGenreCard(
                      context,
                      "Windows",
                      Icons.window_sharp,
                      const WindowsScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "MacOS",
                      Icons.laptop,
                      const MacOSSCreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Android",
                      Icons.android,
                      const AndroidScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "iOS",
                      Icons.apple,
                      const IOSScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Xbox",
                      Icons.screenshot_monitor_outlined,
                      const XboxScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Nintendo Switch",
                      Icons.stay_current_landscape,
                      const NintendoSwitchScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "Linux",
                      Icons.laptop,
                      const LinuxScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      "PlayStation",
                      Icons.gamepad,
                      const PlayStationScreen(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenreCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget targetScreen,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => targetScreen),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C3A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 40),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
