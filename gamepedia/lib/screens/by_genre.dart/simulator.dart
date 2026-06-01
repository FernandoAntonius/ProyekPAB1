import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class SimulatorScreen extends StatelessWidget {
  const SimulatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Simulator Games',
      gamesStream: GameRepository.streamGenreGames('Simulator'),
      emptyMessage: 'No simulator games found.',
    );
  }
}
