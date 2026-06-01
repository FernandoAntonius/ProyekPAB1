import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class HackAndSlashScreen extends StatelessWidget {
  const HackAndSlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Hack and Slash Games',
      gamesStream: GameRepository.streamGenreGames('Hack and Slash'),
      emptyMessage: 'No hack and slash games found.',
    );
  }
}
