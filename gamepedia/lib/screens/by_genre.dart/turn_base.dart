import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class TurnBasedStrategyScreen extends StatelessWidget {
  const TurnBasedStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Turn-Based Strategy Games',
      gamesStream: GameRepository.streamGenreGames('Turn-Based Strategy'),
      emptyMessage: 'No turn-based strategy games found.',
    );
  }
}
