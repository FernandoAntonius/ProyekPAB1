import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_data.dart';
import 'package:gamepedia/models/game.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Game> _filteredGames = gameList;
  String _searchQuery = '';

  final List<String> categories = [
    "Adventure",
    "Role-Playing",
    "Shooter",
    "Platformer",
    "Puzzle",
    "Role-Playing",
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

  int selectedCategory = 1;

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

              // --- TITLE SECTION ---
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
                      colors: [
                        Color(0xFF1124A5), 
                        Color(0xFFB923FF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Text(
                      "GamePedia",
                      style: TextStyle(
                        color: Colors.white, // ShaderMask akan override ini
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
                  fontFamily: 'Quicsand',
                  ),
              ),

              const SizedBox(height: 16),

              // --- SEARCH BAR ---
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _filteredGames = gameList
                          .where((g) => g.title.toLowerCase().contains(
                                _searchQuery.toLowerCase(),
                              ))
                          .toList();
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Search games...",
                    hintStyle: TextStyle(color: Colors.white38),
                    prefixIcon: Icon(Icons.search, color: Colors.white54),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // --- CATEGORY CHIPS ---
              SizedBox(
                height: 36,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final bool isSelected = selectedCategory == index;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() => selectedCategory = index);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? const LinearGradient(
                                    colors: [
                                     Color(0xFF1124A5), 
                                     Color(0xFFB923FF)
                                      ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: isSelected ? null : Colors.white10,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // --- GRID GAME LIST ---
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
                    return Container(
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
                          )
                        ],
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