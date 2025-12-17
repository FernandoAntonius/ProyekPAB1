import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_data.dart';
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
import 'package:gamepedia/screens/loading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Game> _filteredGames = [];
  String _searchQuery = '';

  late final List<Game> popularGames;
  late final List<Game> newReleases;

  @override
  void initState() {
    super.initState();
    popularGames =
        (gameList.where((game) => game.rating > 8).toList()
              ..sort((a, b) => b.rating.compareTo(a.rating)))
            .take(5)
            .toList();

    DateTime sixMonthAgo = DateTime.now().subtract(const Duration(days: 182));
    newReleases =
        (gameList
                .where((game) => game.releaseDate.isAfter(sixMonthAgo))
                .toList()
              ..sort((a, b) => b.releaseDate.compareTo(a.releaseDate)))
            .take(5)
            .toList();

    _filteredGames = newReleases;
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
                //SEARCH BAR
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                        _filteredGames = newReleases
                            .where(
                              (g) => g.title.toLowerCase().contains(
                                _searchQuery.toLowerCase(),
                              ),
                            )
                            .toList();
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search games...",
                      hintStyle: const TextStyle(color: Color(0xFFDCA7FF)),
                      prefixIcon: Container(
                        width: 60,
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [
                              Color(0xFF748AFA),
                              Color(0xFF617BFF),
                              Color(0xFFF47EFF),
                              Color(0xFFFFFFFF),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds),
                          child: const Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 16,
                        right: 20,
                        top: 14,
                        bottom: 14,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                //POPULAR GAME
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LEFT TITLE
                    Row(
                      children: [
                        Icon(
                          Icons.bar_chart_rounded,
                          color: Colors.orangeAccent,
                          size: 22,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Popular Games",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PopularGamesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Show all",
                        style: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'Quicksand',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // POPULAR CARD
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1C3A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const PageScrollPhysics(),
                    itemCount: popularGames.length,
                    itemBuilder: (context, index) {
                      final game = popularGames[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameDetailScreen(game: game),
                            ),
                          );
                        },
                        child: Container(
                          width: 250,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              game.imageAssets,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                //NEW RELEASES TITLE
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.auto_awesome, color: Colors.purpleAccent),
                        SizedBox(width: 6),
                        Text(
                          "New Releases",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewReleasesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Show all",
                        style: TextStyle(
                          color: Colors.white54,
                          fontFamily: 'Quicksand',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // NEW RELEASE LIST
                Column(
                  children: _filteredGames.map((game) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameDetailScreen(game: game),
                          ),
                        );
                      },
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
                              child: Image.asset(
                                game.imageAssets,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    game.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                  }).toList(),
                ),
                const SizedBox(height: 24),

                //BROWSE BY GENRE TITLE
                Row(
                  children: const [
                    Icon(
                      Icons.grid_view_rounded,
                      color: Colors.cyanAccent,
                      size: 22,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Browse by Genre",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                //GENRE GRID
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdventureScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.explore_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Adventure",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RolePlayingScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.auto_stories_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Role-playing",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShooterScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.gps_fixed_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Shooter",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlatformerScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.videogame_asset_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Platformer",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PuzzleScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.extension_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Puzzle",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StrategyScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_tree_rounded,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Strategy",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                //BROWSE BY DEVICE TITLE
                Row(
                  children: const [
                    Icon(Icons.device_hub, color: Colors.cyanAccent, size: 22),
                    SizedBox(width: 6),
                    Text(
                      "Browse by Device",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                //DEVICE GRID
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WindowsScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.window_sharp,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Windows",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MacOSSCreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.laptop,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "MacOS",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AndroidScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.android,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Android",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IOSScreen()),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.apple,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "iOS",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => XboxScreen()),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.screenshot_monitor_outlined,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Xbox",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NintendoSwitchScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.stay_current_landscape,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Nintendo Switch",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LinuxScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.laptop,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Linux",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayStationScreen(),
                          ),
                        );
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C3A),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.gamepad,
                              color: Colors.cyanAccent,
                              size: 40,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "PlayStation",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                          ],
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
    );
  }
}
