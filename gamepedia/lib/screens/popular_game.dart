import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class PopularGamesScreen extends StatelessWidget {
  const PopularGamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Popular Games',
      gamesStream: GameRepository.streamPopularGames(),
      emptyMessage: 'No popular games found.',
    );
  }
}
