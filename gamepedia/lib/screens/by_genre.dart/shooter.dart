import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class ShooterScreen extends StatelessWidget {
  const ShooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Shooter Games',
      gamesStream: GameRepository.streamGenreGames('Shooter'),
      emptyMessage: 'No shooter games found.',
    );
  }
}
