import 'package:flutter/material.dart';
import 'package:gamepedia/data/game_repository.dart';
import 'package:gamepedia/screens/games_list_screen.dart';

class PointAndClickScreen extends StatelessWidget {
  const PointAndClickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GamesListScreen(
      title: 'Point and Click Games',
      gamesStream: GameRepository.streamGenreGames('Point and Click'),
      emptyMessage: 'No point and click games found.',
    );
  }
}
