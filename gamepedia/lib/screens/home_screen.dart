import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/add_game.dart';
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
import 'package:gamepedia/screens/popular_game.dart';
import 'package:gamepedia/l10n/app_localizations.dart';

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
                          MaterialPageRoute(builder: (context) => const AddGameScreen())
                          );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                ),
                
                Text(
                  AppLocalizations.of(context)!.discoverTagline,
                  style: const TextStyle(
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
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.searchHint,
                      hintStyle: const TextStyle(color: Color(0xFFDCA7FF)),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
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
                    Row(
                      children: [
                        const Icon(
                          Icons.bar_chart_rounded,
                          color: Colors.orangeAccent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalizations.of(context)!.popularGames,
                          style: const TextStyle(
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
                      child: Text(
                        AppLocalizations.of(context)!.showAll,
                        style: const TextStyle(color: Colors.white54),
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
                        return Center(
                          child: Text(
                            AppLocalizations.of(context)!.genericError,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final popularGames = snapshot.data ?? [];
                      if (popularGames.isEmpty) {
                        return Center(
                          child: Text(
                            AppLocalizations.of(context)!.noGamesFound,
                            style: const TextStyle(color: Colors.white70),
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
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orangeAccent,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        AppLocalizations.of(context)!.newRelease,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                // SEARCHED / ALL GAMES LIST
                StreamBuilder<List<Game>>(
                  stream: GameRepository.streamAllGames(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          AppLocalizations.of(context)!.genericError,
                          style: const TextStyle(color: Colors.white),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.noGamesFound,
                            style: const TextStyle(color: Colors.white70),
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
                Row(
                  children: [
                    const Icon(
                      Icons.grid_view_rounded,
                      color: Colors.cyanAccent,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalizations.of(context)!.browseByGenre,
                      style: const TextStyle(
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
                      AppLocalizations.of(context)!.genreAdventure,
                      Icons.explore_rounded,
                      const AdventureScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.genreRolePlay,
                      Icons.auto_stories_rounded,
                      const RolePlayingScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.genreShooting,
                      Icons.gps_fixed_rounded,
                      const ShooterScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.genrePlatformer,
                      Icons.videogame_asset_rounded,
                      const PlatformerScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.genrePuzzle,
                      Icons.extension_rounded,
                      const PuzzleScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.genreRealTimeStrategy,
                      Icons.account_tree_rounded,
                      const StrategyScreen(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // BROWSE BY DEVICE
                Row(
                  children: [
                    const Icon(Icons.device_hub, color: Colors.cyanAccent),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalizations.of(context)!.browseByDevice,
                      style: const TextStyle(
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
                      AppLocalizations.of(context)!.deviceWindows,
                      Icons.window_sharp,
                      const WindowsScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceMac,
                      Icons.laptop,
                      const MacOSSCreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceAndroid,
                      Icons.android,
                      const AndroidScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceiOS,
                      Icons.apple,
                      const IOSScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceXbox,
                      Icons.screenshot_monitor_outlined,
                      const XboxScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceNintendoSwitch,
                      Icons.stay_current_landscape,
                      const NintendoSwitchScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.deviceLinux,
                      Icons.laptop,
                      const LinuxScreen(),
                    ),
                    _buildGenreCard(
                      context,
                      AppLocalizations.of(context)!.devicePlayStation,
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
