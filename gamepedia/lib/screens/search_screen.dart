import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/models/game.dart';
import 'package:gamepedia/screens/game_detail_screen.dart';
import 'package:gamepedia/l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  List<Map<String, String>> _genreOptions(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      {'code': 'all', 'label': loc.genreAll},
      {'code': 'Adventure', 'label': loc.genreAdventure},
      {'code': 'Role Play', 'label': loc.genreRolePlay},
      {'code': 'Shooting', 'label': loc.genreShooting},
      {'code': 'Platformer', 'label': loc.genrePlatformer},
      {'code': 'Puzzle', 'label': loc.genrePuzzle},
      {'code': 'Real Time Strategy', 'label': loc.genreRealTimeStrategy},
      {'code': 'Hack And Slash', 'label': loc.genreHackAndSlash},
      {'code': 'Turn Base Strategy', 'label': loc.genreTurnBaseStrategy},
      {'code': 'Point And Click', 'label': loc.genrePointAndClick},
      {'code': 'Indie', 'label': loc.genreIndie},
      {'code': 'Racing', 'label': loc.genreRacing},
      {'code': 'Sport', 'label': loc.genreSport},
      {'code': 'Fighting', 'label': loc.genreFighting},
      {'code': 'Arcade', 'label': loc.genreArcade},
      {'code': 'Simulator', 'label': loc.genreSimulator},
    ];
  }

  List<Map<String, String>> _deviceOptions(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      {'code': 'all', 'label': loc.deviceAll},
      {'code': 'Windows', 'label': loc.deviceWindows},
      {'code': 'PlayStation', 'label': loc.devicePlayStation},
      {'code': 'Xbox', 'label': loc.deviceXbox},
      {'code': 'Nintendo Switch', 'label': loc.deviceNintendoSwitch},
      {'code': 'Android', 'label': loc.deviceAndroid},
      {'code': 'iOS', 'label': loc.deviceiOS},
      {'code': 'Mac', 'label': loc.deviceMac},
      {'code': 'Linux', 'label': loc.deviceLinux},
    ];
  }

  List<String> _priceSort(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return [
      loc.priceSortDefault,
      loc.priceSortLowToHigh,
      loc.priceSortHighToLow,
    ];
  }

  Set<int> selectedGenres = {0};
  Set<int> selectedDevices = {0};
  int selectedPriceSort = 0;

  List<Game> _filterGames(List<Game> games) {
    final genres = _genreOptions(context);
    final devices = _deviceOptions(context);

    final filtered = games.where((game) {
      final titleMatch = game.title.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );

      final gameGenreCodes = game.genre
          .expand((item) => item.split(',').map((s) => s.trim().toLowerCase()))
          .toList();
      final gameDeviceCodes = game.device
          .expand((item) => item.split(',').map((s) => s.trim().toLowerCase()))
          .toList();

      final genreMatch =
          selectedGenres.contains(0) ||
          selectedGenres.any(
            (index) =>
                gameGenreCodes.contains(genres[index]['code']!.toLowerCase()),
          );

      final deviceMatch =
          selectedDevices.contains(0) ||
          selectedDevices.any(
            (index) =>
                gameDeviceCodes.contains(devices[index]['code']!.toLowerCase()),
          );

      return titleMatch && genreMatch && deviceMatch;
    }).toList();

    if (selectedPriceSort == 1) {
      filtered.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedPriceSort == 2) {
      filtered.sort((a, b) => b.price.compareTo(a.price));
    }

    return filtered;
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          final loc = AppLocalizations.of(context)!;
          final genreOptions = _genreOptions(context);
          final deviceOptions = _deviceOptions(context);
          final priceSort = _priceSort(context);

          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: Color(0xFF1A1D3A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loc.filterGamesTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setModalState(() {
                            selectedGenres = {0};
                            selectedDevices = {0};
                            selectedPriceSort = 0;
                          });
                        },
                        child: Text(
                          loc.reset,
                          style: const TextStyle(
                            color: Color(0xFFB923FF),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          loc.genreLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(genreOptions.length, (index) {
                            final option = genreOptions[index];
                            final bool isSelected = selectedGenres.contains(
                              index,
                            );
                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
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
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? const LinearGradient(
                                          colors: [
                                            Color(0xFF1124A5),
                                            Color(0xFFB923FF),
                                          ],
                                        )
                                      : null,
                                  color: isSelected ? null : Colors.white10,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  option['label']!,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          loc.deviceLabel,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(deviceOptions.length, (
                            index,
                          ) {
                            final option = deviceOptions[index];
                            final bool isSelected = selectedDevices.contains(
                              index,
                            );
                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
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
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? const LinearGradient(
                                          colors: [
                                            Color(0xFF1124A5),
                                            Color(0xFFB923FF),
                                          ],
                                        )
                                      : null,
                                  color: isSelected ? null : Colors.white10,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  option['label']!,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          loc.sortByPrice,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(priceSort.length, (index) {
                            final bool isSelected = selectedPriceSort == index;
                            return GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  selectedPriceSort = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? const LinearGradient(
                                          colors: [
                                            Color(0xFF1124A5),
                                            Color(0xFFB923FF),
                                          ],
                                        )
                                      : null,
                                  color: isSelected ? null : Colors.white10,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  priceSort[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.pop(context);
                      },
                      style:
                          ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ).copyWith(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1124A5), Color(0xFFB923FF)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            loc.applyFilters,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  int _getActiveFilterCount() {
    int count = 0;
    if (!selectedGenres.contains(0)) count++;
    if (!selectedDevices.contains(0)) count++;
    if (selectedPriceSort != 0) count++;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final int activeFilters = _getActiveFilterCount();

    return Scaffold(
      backgroundColor: const Color(0xFF0E1126),
      body: SafeArea(
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
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.discoverTagline,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontFamily: 'Quicksand',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                          hintStyle: const TextStyle(
                            color: Color(0xFFDCA7FF),
                            fontFamily: 'Quicksand',
                          ),
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
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
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
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _showFilterBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1124A5), Color(0xFFB923FF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: 24,
                          ),
                          if (activeFilters > 0)
                            Positioned(
                              right: -2,
                              top: -2,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00FF88),
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '$activeFilters',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Quicksand',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              StreamBuilder<List<Game>>(
                stream: GameRepository.streamAllGames(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Unable to load games.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final filteredGames = _filterGames(snapshot.data ?? []);

                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(
                            context,
                          )!.gamesFound(filteredGames.length),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: filteredGames.isEmpty
                              ? const Center(
                                  child: Text(
                                    'No games match the selected filters.',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontFamily: 'Quicksand',
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  itemCount: filteredGames.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 12,
                                        crossAxisSpacing: 12,
                                        childAspectRatio: 0.72,
                                      ),
                                  itemBuilder: (context, index) {
                                    final game = filteredGames[index];
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
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white10,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child:
                                                  game.imageAssets.startsWith(
                                                    'http',
                                                  )
                                                  ? Image.network(
                                                      game.imageAssets,
                                                      height: 80,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.asset(
                                                      game.imageAssets,
                                                      height: 80,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                            const SizedBox(height: 6),
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
                                              game.price > 0
                                                  ? "\$${game.price}"
                                                  : "FREE",
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
