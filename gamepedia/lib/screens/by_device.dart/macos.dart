import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class MacOSSCreen extends StatelessWidget {
  const MacOSSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'MacOS Device',
      gamesStream: GameRepository.streamDeviceGames('Mac'),
      emptyMessage: 'No MacOS games found.',
    );
  }
}
