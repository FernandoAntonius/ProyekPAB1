import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class RacingScreen extends StatelessWidget {
  const RacingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Racing Games',
      gamesStream: GameRepository.streamGenreGames('Racing'),
      emptyMessage: 'No racing games found.',
    );
  }
}
