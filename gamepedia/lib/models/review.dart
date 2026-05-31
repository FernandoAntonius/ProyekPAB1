import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String author;
  final String content;
  final String gameName;
  final int rating;
  final DateTime createdAt;

  Review({
    required this.author,
    required this.content,
    required this.gameName,
    required this.rating,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Review.fromFirestore(Map<String, dynamic> data) {
    final rawCreatedAt = data['createdAt'];
    DateTime parsedCreatedAt;
    if (rawCreatedAt is Timestamp) {
      parsedCreatedAt = rawCreatedAt.toDate();
    } else if (rawCreatedAt is DateTime) {
      parsedCreatedAt = rawCreatedAt;
    } else {
      parsedCreatedAt = DateTime.now();
    }

    return Review(
      author: data['author']?.toString() ?? 'Anonymous',
      content: data['content']?.toString() ?? '',
      gameName: data['gameName']?.toString() ?? 'Unknown Game',
      rating: (data['rating'] is num) ? (data['rating'] as num).toInt() : 0,
      createdAt: parsedCreatedAt,
    );
  }
}
