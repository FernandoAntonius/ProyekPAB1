import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class StrategyScreen extends StatelessWidget {
  const StrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Strategy Games',
      gamesStream: GameRepository.streamGenreGames('Strategy'),
      emptyMessage: 'No strategy games found.',
    );
  }
}
