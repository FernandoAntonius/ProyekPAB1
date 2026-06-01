import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class IndieScreen extends StatelessWidget {
  const IndieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Indie Games',
      gamesStream: GameRepository.streamGenreGames('Indie'),
      emptyMessage: 'No indie games found.',
    );
  }
}
