import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static final CollectionReference<Map<String, dynamic>> _favoritesCollection =
      FirebaseFirestore.instance.collection('favorites');

  static Stream<List<String>> streamFavoritesForUser(String username) {
    return _favoritesCollection.doc(username).snapshots().map((snap) {
      if (!snap.exists) return <String>[];
      final data = snap.data() ?? {};
      final titles = data['titles'];
      if (titles is List)
        return List<String>.from(titles.map((e) => e.toString()));
      return <String>[];
    });
  }

  static Future<List<String>> getFavoritesOnce(String username) async {
    final snap = await _favoritesCollection.doc(username).get();
    if (!snap.exists) return <String>[];
    final data = snap.data() ?? {};
    final titles = data['titles'];
    if (titles is List)
      return List<String>.from(titles.map((e) => e.toString()));
    return <String>[];
  }

  static Future<void> addFavorite(String username, String title) async {
    await _favoritesCollection.doc(username).set({
      'titles': FieldValue.arrayUnion([title]),
    }, SetOptions(merge: true));
  }

  static Future<void> removeFavorite(String username, String title) async {
    await _favoritesCollection.doc(username).set({
      'titles': FieldValue.arrayRemove([title]),
    }, SetOptions(merge: true));
  }

  static Future<void> setFavoritesForUser(
    String username,
    List<String> titles,
  ) async {
    await _favoritesCollection.doc(username).set({'titles': titles});
  }

  static Future<void> migrateLocalFavoritesFromPrefs(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final titles = prefs
        .getKeys()
        .where((key) {
          return key.startsWith('favorite_') && prefs.getBool(key) == true;
        })
        .map((k) => k.substring('favorite_'.length))
        .toList();
    if (titles.isNotEmpty) {
      await setFavoritesForUser(username, titles);
    }
  }
}
