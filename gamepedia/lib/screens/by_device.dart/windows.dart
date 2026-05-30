import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class WindowsScreen extends StatelessWidget {
  const WindowsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Windows Device',
      gamesStream: GameRepository.streamDeviceGames('Windows'),
      emptyMessage: 'No Windows games found.',
    );
  }
}
