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

  final List<String> genres = [
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

  final List<String> devices = [
    "All Devices",
    "PC",
    "PlayStation",
    "Xbox",
    "Nintendo Switch",
    "Mobile",
  ];

  final List<String> priceSort = [
    "Default",
    "Low to High",
    "High to Low",
  ];

  Set<int> selectedGenres = {0};
  Set<int> selectedDevices = {0};
  int selectedPriceSort = 0;
  int activeFilterTab = 0;

  @override
  void initState() {
    super.initState();
    _filterGames();
  }

  void _filterGames() {
    setState(() {
      _filteredGames = gameList.where((game) {
        bool titleMatch = game.title.toLowerCase().contains(
          _searchQuery.toLowerCase(),
        );

        bool genreMatch = selectedGenres.contains(0) ||
            selectedGenres.any(
              (index) => game.genre.contains(genres[index]),
            );

        bool deviceMatch = selectedDevices.contains(0) ||
            selectedDevices.any(
              (index) => game.avaible.contains(devices[index]),
            );

        return titleMatch && genreMatch && deviceMatch;
      }).toList();

      if (selectedPriceSort == 1) {
        _filteredGames.sort((a, b) => a.price.compareTo(b.price));
      } else if (selectedPriceSort == 2) {     
        _filteredGames.sort((a, b) => b.price.compareTo(a.price));
      }
    });
  }

  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
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
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.white70,
                  fontFamily: 'Quicksand',
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

              // FILTER TABS
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeFilterTab = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: activeFilterTab == 0
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF1124A5),
                                    Color(0xFFB923FF),
                                  ],
                                )
                              : null,
                          color: activeFilterTab == 0 ? null : Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Genre",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: activeFilterTab == 0
                                ? Colors.white
                                : Colors.white70,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeFilterTab = 1;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: activeFilterTab == 1
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF1124A5),
                                    Color(0xFFB923FF),
                                  ],
                                )
                              : null,
                          color: activeFilterTab == 1 ? null : Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Device",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: activeFilterTab == 1
                                ? Colors.white
                                : Colors.white70,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeFilterTab = 2;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: activeFilterTab == 2
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF1124A5),
                                    Color(0xFFB923FF),
                                  ],
                                )
                              : null,
                          color: activeFilterTab == 2 ? null : Colors.white10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Price",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: activeFilterTab == 2
                                ? Colors.white
                                : Colors.white70,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // FILTER OPTIONS
              SizedBox(
                height: 36,
                child: activeFilterTab == 0
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          final bool isSelected =
                              selectedGenres.contains(index);
                          return _buildFilterChip(
                            genres[index],
                            isSelected,
                            () {
                              setState(() {
                                if (index == 0) {
                                  selectedGenres = {0};
                                } else {
                                  if (selectedGenres.contains(0)) {
                                    selectedGenres.remove(0);
                                  }
                                  if (isSelected) {
                                    selectedGenres.remove(index);
                                    if (selectedGenres.isEmpty) {
                                      selectedGenres = {0};
                                    }
                                  } else {
                                    selectedGenres.add(index);
                                  }
                                }
                                _filterGames();
                              });
                            },
                          );
                        },
                      )
                    : activeFilterTab == 1
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: devices.length,
                            itemBuilder: (context, index) {
                              final bool isSelected =
                                  selectedDevices.contains(index);
                              return _buildFilterChip(
                                devices[index],
                                isSelected,
                                () {
                                  setState(() {
                                    if (index == 0) {
                                      selectedDevices = {0};
                                    } else {
                                      if (selectedDevices.contains(0)) {
                                        selectedDevices.remove(0);
                                      }
                                      if (isSelected) {
                                        selectedDevices.remove(index);
                                        if (selectedDevices.isEmpty) {
                                          selectedDevices = {0};
                                        }
                                      } else {
                                        selectedDevices.add(index);
                                      }
                                    }
                                    _filterGames();
                                  });
                                },
                              );
                            },
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: priceSort.length,
                            itemBuilder: (context, index) {
                              final bool isSelected = selectedPriceSort == index;
                              return _buildFilterChip(
                                priceSort[index],
                                isSelected,
                                () {
                                  setState(() {
                                    selectedPriceSort = index;
                                    _filterGames();
                                  });
                                },
                              );
                            },
                          ),
              ),

              const SizedBox(height: 16),

              // RESULT COUNT
              Text(
                "${_filteredGames.length} games found",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontFamily: 'Quicksand',
                ),
              ),

              const SizedBox(height: 8),

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
                            builder: (context) => GameDetailScreen(game: game),
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
                                fontFamily: 'Quicksand',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "\$${game.price}",
                              style: const TextStyle(
                                color: Color(0xFF00FF88),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
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