import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class LinuxScreen extends StatelessWidget {
  const LinuxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Linux Device',
      gamesStream: GameRepository.streamDeviceGames('Linux'),
      emptyMessage: 'No Linux games found.',
    );
  }
}
