import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class PlatformerScreen extends StatelessWidget {
  const PlatformerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Platformer Games',
      gamesStream: GameRepository.streamGenreGames('Platformer'),
      emptyMessage: 'No platformer games found.',
    );
  }
}
