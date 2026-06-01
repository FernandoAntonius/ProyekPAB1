import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class FightingScreen extends StatelessWidget {
  const FightingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Fighting Games',
      gamesStream: GameRepository.streamGenreGames('Fighting'),
      emptyMessage: 'No fighting games found.',
    );
  }
}
