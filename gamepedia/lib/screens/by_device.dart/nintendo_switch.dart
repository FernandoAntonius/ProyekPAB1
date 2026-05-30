import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class NintendoSwitchScreen extends StatelessWidget {
  const NintendoSwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Nintendo Switch',
      gamesStream: GameRepository.streamDeviceGames('Nintendo Switch'),
      emptyMessage: 'No Nintendo Switch games found.',
    );
  }
}
