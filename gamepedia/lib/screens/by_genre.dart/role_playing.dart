import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class RolePlayingScreen extends StatelessWidget {
  const RolePlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Role Playing Games',
      gamesStream: GameRepository.streamGenreGames('Role-Playing'),
      emptyMessage: 'No role-playing games found.',
    );
  }
}
