import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/data/favorites_service.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/game_detail_screen.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Set<String> favoriteTitles = {};
  bool favoritesLoaded = false;
  bool isSignedIn = false;
  String username = 'guest';

  @override
  void initState() {
    super.initState();
    _loadFavoriteTitles();
  }

  void _loadFavoriteTitles() async {
    final prefs = await SharedPreferences.getInstance();
    isSignedIn = prefs.getBool('isSignedIn') ?? false;
    username = prefs.getString('username') ?? 'guest';

    if (!isSignedIn) {
      final titles = prefs
          .getKeys()
          .where((key) {
            return key.startsWith('favorite_') && prefs.getBool(key) == true;
          })
          .map((key) => key.substring('favorite_'.length))
          .toSet();
      setState(() {
        favoriteTitles = titles;
        favoritesLoaded = true;
      });
    } else {
      // we'll rely on Firestore stream for favorites when building
      setState(() {
        favoritesLoaded = true;
      });
    }
  }

  void _toggleFavorite(Game game) async {
    final prefs = await SharedPreferences.getInstance();
    isSignedIn = prefs.getBool('isSignedIn') ?? false;
    username = prefs.getString('username') ?? 'guest';

    if (isSignedIn) {
      await FavoritesService.removeFavorite(username, game.title);
    } else {
      final currentStatus = prefs.getBool('favorite_${game.title}') ?? false;
      await prefs.setBool('favorite_${game.title}', !currentStatus);

      setState(() {
        if (currentStatus) {
          favoriteTitles.remove(game.title);
        } else {
          favoriteTitles.add(game.title);
        }
      });
    }
  }

  Widget _buildSavedCount() {
    if (isSignedIn) {
      return StreamBuilder<List<String>>(
        stream: FavoritesService.streamFavoritesForUser(username),
        builder: (context, snapshot) {
          final count = snapshot.data?.length ?? 0;
          return Text(
            AppLocalizations.of(context)!.gamesSaved(count),
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 13,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
            ),
          );
        },
      );
    }

    return Text(
      AppLocalizations.of(context)!.gamesSaved(favoriteTitles.length),
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 13,
        fontFamily: 'Quicksand',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 26),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 2, 26),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          color: const Color(0xFF6A5AF9),
        ),
        title: Text(
          AppLocalizations.of(context)!.wishlist,
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF3737), Color(0xFFFF7BC4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF3737).withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.favorite,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFFFF3737), Color(0xFFFF7BC4)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds),
                child: Text(
                  AppLocalizations.of(context)!.wishlist,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              _buildSavedCount(),
              const SizedBox(height: 24),
              if (!favoritesLoaded)
                const Center(child: CircularProgressIndicator())
              else if (!isSignedIn && favoriteTitles.isEmpty)
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      AppLocalizations.of(context)!.yourWishlistEmpty,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.startAddingGames,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              else
                Builder(
                  builder: (context) {
                    if (isSignedIn) {
                      // For signed-in users, stream favorites from Firestore and combine with games
                      return StreamBuilder<List<String>>(
                        stream: FavoritesService.streamFavoritesForUser(
                          username,
                        ),
                        builder: (context, favSnap) {
                          if (favSnap.hasError) {
                            return Text(
                              AppLocalizations.of(
                                context,
                              )!.unableToLoadWishlistGames,
                              style: const TextStyle(color: Colors.white70),
                            );
                          }
                          if (favSnap.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final favTitles = favSnap.data ?? <String>[];

                          return StreamBuilder<List<Game>>(
                            stream: GameRepository.streamAllGames(),
                            builder: (context, snap) {
                              if (snap.hasError) {
                                return Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.unableToLoadWishlistGames,
                                  style: const TextStyle(color: Colors.white70),
                                );
                              }
                              if (snap.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final games = snap.data ?? [];
                              final favorites = games
                                  .where((g) => favTitles.contains(g.title))
                                  .toList();
                              if (favorites.isEmpty) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 40),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.yourWishlistEmpty,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.startAddingGames,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                );
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: favorites.length,
                                itemBuilder: (context, index) {
                                  final game = favorites[index];
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
                                      margin: const EdgeInsets.only(bottom: 16),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFF1A1D3A),
                                            Color(0xFF2D1B3D),
                                          ],
                                        ),
                                        border: Border.all(
                                          color: const Color(
                                            0xFFFF3737,
                                          ).withOpacity(0.3),
                                          width: 1.5,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFFFF3737,
                                            ).withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  image: DecorationImage(
                                                    image:
                                                        game.imageAssets
                                                            .startsWith('http')
                                                        ? NetworkImage(
                                                            game.imageAssets,
                                                          )
                                                        : AssetImage(
                                                                game.imageAssets,
                                                              )
                                                              as ImageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 6,
                                                left: 6,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 2,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        size: 10,
                                                        color: Colors.amber,
                                                      ),
                                                      const SizedBox(width: 2),
                                                      Text(
                                                        game.rating.toString(),
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  game.title,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 8),
                                                SizedBox(
                                                  height: 25,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        game.genre.length,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        margin:
                                                            const EdgeInsets.only(
                                                              right: 6,
                                                            ),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                    0xFF3A3FF2,
                                                                  ),
                                                                  Color(
                                                                    0xFF7754F4,
                                                                  ),
                                                                ],
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                20,
                                                              ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          game.genre[index],
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 11,
                                                                height: 1.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                SizedBox(
                                                  height: 22,
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        game.device.length,
                                                    itemBuilder: (context, index) {
                                                      return Container(
                                                        margin:
                                                            const EdgeInsets.only(
                                                              right: 6,
                                                            ),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: Colors.white
                                                              .withOpacity(0.1),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                14,
                                                              ),
                                                          border: Border.all(
                                                            color:
                                                                Colors.white30,
                                                          ),
                                                        ),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          game.device[index],
                                                          style:
                                                              const TextStyle(
                                                                color: Colors
                                                                    .white70,
                                                                fontSize: 10,
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
                                                      game.releaseDate
                                                          .toString()
                                                          .split(' ')[0],
                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () =>
                                                          _toggleFavorite(game),
                                                      child: const Icon(
                                                        Icons.favorite,
                                                        color: Color(
                                                          0xFFFF3737,
                                                        ),
                                                        size: 24,
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
                              );
                            },
                          );
                        },
                      );
                    } else {
                      // not signed in: use local favorites (already loaded)
                      return StreamBuilder<List<Game>>(
                        stream: GameRepository.streamAllGames(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                              'Unable to load wishlist games.',
                              style: TextStyle(color: Colors.white70),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final games = snapshot.data ?? [];
                          final favorites = games
                              .where(
                                (game) => favoriteTitles.contains(game.title),
                              )
                              .toList();
                          if (favorites.isEmpty) {
                            return Column(
                              children: [
                                const SizedBox(height: 40),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.yourWishlistEmpty,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.startAddingGames,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          }

                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: favorites.length,
                            itemBuilder: (context, index) {
                              final game = favorites[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GameDetailScreen(game: game),
                                    ),
                                  ).then((_) {
                                    _loadFavoriteTitles();
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF1A1D3A),
                                        Color(0xFF2D1B3D),
                                      ],
                                    ),
                                    border: Border.all(
                                      color: const Color(
                                        0xFFFF3737,
                                      ).withOpacity(0.3),
                                      width: 1.5,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(
                                          0xFFFF3737,
                                        ).withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image:
                                                    game.imageAssets.startsWith(
                                                      'http',
                                                    )
                                                    ? NetworkImage(
                                                        game.imageAssets,
                                                      )
                                                    : AssetImage(
                                                            game.imageAssets,
                                                          )
                                                          as ImageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 6,
                                            left: 6,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.black.withOpacity(
                                                  0.7,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 10,
                                                    color: Colors.amber,
                                                  ),
                                                  const SizedBox(width: 2),
                                                  Text(
                                                    game.rating.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              game.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Quicksand',
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 8),
                                            SizedBox(
                                              height: 25,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: game.genre.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          right: 6,
                                                        ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                            colors: [
                                                              Color(0xFF3A3FF2),
                                                              Color(0xFF7754F4),
                                                            ],
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            20,
                                                          ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      game.genre[index],
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        height: 1.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            SizedBox(
                                              height: 22,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: game.device.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                          right: 6,
                                                        ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 10,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14,
                                                          ),
                                                      border: Border.all(
                                                        color: Colors.white30,
                                                      ),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      game.device[index],
                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10,
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
                                                  game.releaseDate
                                                      .toString()
                                                      .split(' ')[0],
                                                  style: const TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () =>
                                                      _toggleFavorite(game),
                                                  child: const Icon(
                                                    Icons.favorite,
                                                    color: Color(0xFFFF3737),
                                                    size: 24,
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
                          );
                        },
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
