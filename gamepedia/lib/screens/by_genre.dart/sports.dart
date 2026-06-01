import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Sports Games',
      gamesStream: GameRepository.streamGenreGames('Sports'),
      emptyMessage: 'No sports games found.',
    );
  }
}
