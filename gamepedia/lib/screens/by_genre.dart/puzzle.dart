import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Puzzle Games',
      gamesStream: GameRepository.streamGenreGames('Puzzle'),
      emptyMessage: 'No puzzle games found.',
    );
  }
}
