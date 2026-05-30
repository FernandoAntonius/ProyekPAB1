import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class NewReleasesScreen extends StatelessWidget {
  const NewReleasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'New Releases',
      gamesStream: GameRepository.streamRecentlyReleased(),
      emptyMessage: 'No new releases found.',
    );
  }
}
