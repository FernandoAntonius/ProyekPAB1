import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class ArcadeScreen extends StatelessWidget {
  const ArcadeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Arcade Games',
      gamesStream: GameRepository.streamGenreGames('Arcade'),
      emptyMessage: 'No arcade games found.',
    );
  }
}
