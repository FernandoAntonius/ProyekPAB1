import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamepedia/models/game.dart';

class GameRepository {
  static final CollectionReference<Map<String, dynamic>> _gamesCollection =
      FirebaseFirestore.instance.collection('games');

  static Stream<List<Game>> streamAllGames() {
    return _gamesCollection.snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Game.fromFirestore(doc.data())).toList(),
    );
  }

  static Stream<List<Game>> streamPopularGames() {
    return _gamesCollection
        .where('rating', isGreaterThan: 8)
        .orderBy('rating', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Game.fromFirestore(doc.data()))
              .toList(),
        );
  }

  static Stream<List<Game>> streamGenreGames(String genre) {
    return _gamesCollection
        .where('genre', arrayContains: genre)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Game.fromFirestore(doc.data()))
              .toList(),
        );
  }

  static Stream<List<Game>> streamDeviceGames(String device) {
    return _gamesCollection
        .where('device', arrayContains: device)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Game.fromFirestore(doc.data()))
              .toList(),
        );
  }

  static Stream<List<Game>> streamRecentlyReleased({int days = 182}) {
    return streamAllGames().map((games) {
      final cutoff = DateTime.now().subtract(Duration(days: days));
      final filtered = games
          .where((game) => game.releaseDate.isAfter(cutoff))
          .toList();
      filtered.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
      return filtered;
    });
  }
}
