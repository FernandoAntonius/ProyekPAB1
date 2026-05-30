import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Android Device',
      gamesStream: GameRepository.streamDeviceGames('Android'),
      emptyMessage: 'No Android device games found.',
    );
  }
}
