import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class AdventureScreen extends StatelessWidget {
  const AdventureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Adventure Games',
      gamesStream: GameRepository.streamGenreGames('Adventure'),
      emptyMessage: 'No adventure games found.',
    );
  }
}
