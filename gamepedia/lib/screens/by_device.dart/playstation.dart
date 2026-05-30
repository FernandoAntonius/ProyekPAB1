import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class PlayStationScreen extends StatelessWidget {
  const PlayStationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'PlayStation Device',
      gamesStream: GameRepository.streamDeviceGames('PlayStation'),
      emptyMessage: 'No PlayStation games found.',
    );
  }
}
