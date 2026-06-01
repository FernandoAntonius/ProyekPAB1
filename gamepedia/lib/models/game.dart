import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final String title;
  final String developer;
  final double rating;
  final DateTime releaseDate;
  final double price;
  final List<String> device;
  final List<String> genre;
  final String description;
  final String imageAssets;
  final List<String> screenShots;
  final Map<String, Map<String, String>> systemRequirements;

  Game({
    required this.title,
    required this.developer,
    required this.rating,
    required this.releaseDate,
    required this.price,
    required this.device,
    required this.genre,
    required this.description,
    required this.imageAssets,
    required this.screenShots,
    required this.systemRequirements,
  });

  factory Game.fromFirestore(Map<String, dynamic> data) {
    final dynamic rawReleaseDate = data['releaseDate'];
    DateTime parsedReleaseDate = DateTime.now();
    if (rawReleaseDate is Timestamp) {
      parsedReleaseDate = rawReleaseDate.toDate();
    } else if (rawReleaseDate is DateTime) {
      parsedReleaseDate = rawReleaseDate;
    } else if (rawReleaseDate is String && rawReleaseDate.isNotEmpty) {
      parsedReleaseDate = DateTime.tryParse(rawReleaseDate) ?? DateTime.now();
    }
    return Game(
      title: data['title'] ?? '',
      developer: data['studio'] ?? '',
      rating: (data['rating'] is num)
          ? (data['rating'] as num).toDouble()
          : 0.0,
      releaseDate: parsedReleaseDate,
      price: (data['price'] is num) ? (data['price'] as num).toDouble() : 0.0,
      device: data['device'] is List
          ? List<String>.from(data['device'])
          : [data['device']?.toString() ?? ''],
      genre: data['genre'] is List
          ? List<String>.from(data['genre'])
          : [data['genre']?.toString() ?? ''],
      description: data['description'] ?? '',
      imageAssets: data['imageAssets'] ?? 'images/gamepedia.png',
      screenShots: data['screenshots'] is List
          ? List<String>.from(data['screenshots'])
          : [],
      systemRequirements: Map<String, Map<String, String>>.from(
        (data['systemRequirements'] ?? {}).map(
          (key, value) =>
              MapEntry(key.toString(), Map<String, String>.from(value ?? {})),
        ),
      ),
    );
  }
}
