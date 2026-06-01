import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gamepedia/data/favorites_service.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/models/review.dart';
import 'package:gamepedia/screens/add_review_screen.dart';
import 'package:gamepedia/screens/all_review_screen.dart';
import 'package:gamepedia/screens/edit_game.dart';
import 'package:gamepedia/widgets/info_card.dart';
import 'package:gamepedia/l10n/app_localizations.dart';
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
  bool _isAdmin = false;
  String _currentUsername = '';

  Widget _buildSystemRequirements(BuildContext context, Game game) {
    final loc = AppLocalizations.of(context)!;
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
          Text(
            loc.systemRequirements,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Minimum Requirements
          Text(
            AppLocalizations.of(context)!.minimum,
            style: const TextStyle(
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
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.recommended,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Quicksand",
            ),
          ),
          const SizedBox(height: 6),
          if (sysReq.containsKey('recommended'))
            ...sysReq['recommended']!.entries.map(
              (entry) => Text(
                "• ${entry.key}: ${entry.value}",
                style: const TextStyle(color: Colors.white70),
              ),
            ),
        ],
      ),
    );
  }

  String _localizedGenre(String genre, BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final value = genre.toLowerCase();
    if (value.contains('adventure')) return loc.genreAdventure;
    if (value.contains('role')) return loc.genreRolePlay;
    if (value.contains('rpg')) return loc.genreRolePlay;
    if (value.contains('shoot')) return loc.genreShooting;
    if (value.contains('platform')) return loc.genrePlatformer;
    if (value.contains('puzzle')) return loc.genrePuzzle;
    if (value.contains('real time strategy') || value.contains('real time')) {
      return loc.genreRealTimeStrategy;
    }
    if (value.contains('hack') || value.contains('slash'))
      return loc.genreHackAndSlash;
    if (value.contains('turn base') || value.contains('turn-based')) {
      return loc.genreTurnBaseStrategy;
    }
    if (value.contains('point') || value.contains('click'))
      return loc.genrePointAndClick;
    if (value.contains('indie')) return loc.genreIndie;
    if (value.contains('race')) return loc.genreRacing;
    if (value.contains('sport')) return loc.genreSport;
    if (value.contains('fight')) return loc.genreFighting;
    if (value.contains('arcade')) return loc.genreArcade;
    if (value.contains('simu')) return loc.genreSimulator;
    return genre;
  }

  String _localizedDevice(String platform, BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final value = platform.toLowerCase();
    if (value.contains('windows')) return loc.deviceWindows;
    if (value.contains('playstation')) return loc.devicePlayStation;
    if (value.contains('xbox')) return loc.deviceXbox;
    if (value.contains('nintendo') || value.contains('switch')) {
      return loc.deviceNintendoSwitch;
    }
    if (value.contains('android')) return loc.deviceAndroid;
    if (value.contains('ios') ||
        value.contains('iphone') ||
        value.contains('ipad'))
      return loc.deviceiOS;
    if (value.contains('mac')) return loc.deviceMac;
    if (value.contains('linux')) return loc.deviceLinux;
    return platform;
  }

  @override
  void initState() {
    super.initState();
    _checkSignInStatus();
    _loadFavoritesStatus();
    _loadAdminStatus();
    _loadCurrentUsername();
  }

  void _loadAdminStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAdmin = prefs.getBool('isAdmin') ?? false;
    setState(() {
      _isAdmin = isAdmin;
    });
  }

  void _loadCurrentUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentUsername = prefs.getString('username') ?? '';
    });
  }

  Future<void> _deleteGame() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF161A3A),
        title: const Text('Delete Game', style: TextStyle(color: Colors.white)),
        content: Text(
          'Are you sure you want to delete "${widget.game.title}"? This action cannot be undone.',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    try {
      await FirebaseFirestore.instance
          .collection('games')
          .where('title', isEqualTo: widget.game.title)
          .get()
          .then((snapshot) {
            for (var doc in snapshot.docs) {
              doc.reference.delete();
            }
          });
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Game deleted successfully')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to delete game: $e')));
      }
    }
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

  Widget _buildReviewCard(Review review, {String? reviewId}) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (review.username.isNotEmpty)
                      Text(
                        '@${review.username}',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
              if ((_isAdmin ||
                      (review.username.isNotEmpty &&
                          review.username == _currentUsername)) &&
                  reviewId != null)
                IconButton(
                  onPressed: () async {
                    try {
                      await FirebaseFirestore.instance
                          .collection('reviews')
                          .doc(reviewId)
                          .delete();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Review deleted successfully'),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to delete review: $e'),
                          ),
                        );
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                    size: 20,
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
          if (review.latitude != null && review.longitude != null) ...[
            const SizedBox(height: 8),
            Text(
              'Location: ${review.latitude!.toStringAsFixed(4)}, ${review.longitude!.toStringAsFixed(4)}',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('reviews')
                .where('gameName', isEqualTo: widget.game.title)
                .snapshots(),
            builder: (context, snapshot) {
              final reviewCount = snapshot.data?.docs.length ?? 0;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              final docs = snapshot.data?.docs ?? [];
              final reviews =
                  docs
                      .map(
                        (d) => MapEntry(d.id, Review.fromFirestore(d.data())),
                      )
                      .toList()
                    ..sort(
                      (a, b) => b.value.createdAt.compareTo(a.value.createdAt),
                    );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${loc.reviews} ($reviewCount)',
                          style: const TextStyle(
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
                              builder: (_) => AddReviewScreen(
                                fixedGameName: widget.game.title,
                              ),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF6A5AF9),
                        ),
                        child: Text(loc.addReview),
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
                        child: Text(loc.viewAll),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (reviews.isEmpty)
                    Text(
                      loc.noReviewsYet,
                      style: TextStyle(color: Colors.grey.shade400),
                    )
                  else
                    Column(
                      children: reviews
                          .take(3)
                          .map(
                            (entry) => _buildReviewCard(
                              entry.value,
                              reviewId: entry.key,
                            ),
                          )
                          .toList(),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
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
          if (_isAdmin)
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditGameScreen(game: widget.game),
                  ),
                );
              },
              icon: const Icon(Icons.edit, color: Color(0xFF6A5AF9)),
              tooltip: 'Edit Game',
            ),
          if (_isAdmin)
            IconButton(
              onPressed: _deleteGame,
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Delete Game',
            ),
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
            // MAIN IMAGE (force fixed size and support network or asset)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 230,
                  width: double.infinity,
                  child:
                      widget.game.imageAssets.toLowerCase().startsWith('http')
                      ? CachedNetworkImage(
                          imageUrl: widget.game.imageAssets,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 230,
                          placeholder: (context, url) =>
                              Container(color: Colors.white12),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.white12,
                            child: const Icon(
                              Icons.broken_image,
                              color: Colors.red,
                            ),
                          ),
                        )
                      : Image.asset(
                          widget.game.imageAssets,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 230,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection('reviews')
                                .where('gameName', isEqualTo: widget.game.title)
                                .snapshots(),
                            builder: (context, snapshot) {
                              double averageRating = 0.0;
                              if (snapshot.hasData &&
                                  snapshot.data!.docs.isNotEmpty) {
                                final ratings = snapshot.data!.docs
                                    .map(
                                      (doc) => Review.fromFirestore(
                                        doc.data(),
                                      ).rating,
                                    )
                                    .toList();
                                final totalRating = ratings.fold<int>(
                                  0,
                                  (sum, rating) => sum + rating,
                                );
                                averageRating = totalRating / ratings.length;
                              }
                              return Text(
                                averageRating.toStringAsFixed(1),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildInfoCard(
                    icon: Icons.calendar_month,
                    title: loc.releaseDate,
                    value: widget.game.releaseDate.toString().split(' ')[0],
                  ),
                  const SizedBox(width: 10),
                  buildInfoCard(
                    icon: Icons.attach_money,
                    title: loc.price,
                    value: "\$${widget.game.price}",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            buildSectionTitle(loc.availableOn),
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
                              _localizedDevice(platform, context),
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
            buildSectionTitle(loc.genreLabel),
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
                              _localizedGenre(genre, context),
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
            buildSectionTitle(loc.aboutThisGame),
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
            buildSectionTitle(loc.screenshots),
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
            _buildSystemRequirements(context, widget.game),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
