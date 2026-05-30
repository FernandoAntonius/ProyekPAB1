import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class IOSScreen extends StatelessWidget {
  const IOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'iOS Device',
      gamesStream: GameRepository.streamDeviceGames('iOS'),
      emptyMessage: 'No iOS games found.',
    );
  }
}
