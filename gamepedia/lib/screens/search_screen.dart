import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_data.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/game_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Game> _filteredGames = gameList;
  String _searchQuery = '';

  final List<String> categories = [
    "All",
    "Adventure",
    "Role-Playing",
    "Shooter",
    "Platformer",
    "Puzzle",
    "Strategy",
    "Hack and Slash",
    "Real-Time Strategy",
    "Turn-Based Strategy",
    "Point-and-click",
    "Indie",
    "Racing",
    "Sport",
    "Fighting",
    "Arcade",
    "Simulator",
  ];

  Set<int> selectedCategories = {0};

  @override
  void initState() {
    super.initState();
    _filterGames();
  }

  void _filterGames() {
    setState(() {
      _filteredGames = gameList.where((game) {
        bool titleGame = game.title.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );
        bool filterGenre =
            selectedCategories.contains(0) ||
            selectedCategories.any(
              (index) => game.genre.contains(categories[index]),
            );
        return titleGame && filterGenre;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1126),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              //TITLE
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
                    _searchQuery = value;
                    _filterGames();
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search games...",
                    hintStyle: const TextStyle(
                      color: Color(0xFFDCA7FF),
                      fontFamily: 'Quicksand',
                    ),
                    prefixIcon: ShaderMask(
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
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 40,
                      minHeight: 40,
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

              const SizedBox(height: 12),

              //CATEGORY NAV
              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final bool isSelected = selectedCategories.contains(index);
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (index == 0) {
                              selectedCategories = {0};
                            } else {
                              if (selectedCategories.contains(0)) {
                                selectedCategories.remove(0);
                              }
                              if (isSelected) {
                                selectedCategories.remove(index);
                                if (selectedCategories.isEmpty) {
                                  selectedCategories = {0};
                                }
                              } else {
                                selectedCategories.add(index);
                              }
                            }
                            _filterGames();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF1124A5),
                                      Color(0xFFB923FF),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: isSelected ? null : Colors.white10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                categories[index],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white70,
                                ),
                              ),
                              if (isSelected)
                                const Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              //GRID GAME LIST
              Expanded(
                child: GridView.builder(
                  itemCount: _filteredGames.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final game = _filteredGames[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GameDetailScreen(game: gameList[0]),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            // IMAGE
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                game.imageAssets,
                                height: 80,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(height: 6),
                            // TITLE
                            Text(
                              game.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Updated today",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
