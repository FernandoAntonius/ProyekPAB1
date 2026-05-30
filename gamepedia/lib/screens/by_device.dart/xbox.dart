import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class XboxScreen extends StatelessWidget {
  const XboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Xbox Device',
      gamesStream: GameRepository.streamDeviceGames('Xbox'),
      emptyMessage: 'No Xbox games found.',
    );
  }
}
