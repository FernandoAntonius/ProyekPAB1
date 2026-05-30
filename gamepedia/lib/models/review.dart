class Review {
  final String author;
  final String content;
  final int rating;
  final DateTime createdAt;

  Review({
    required this.author,
    required this.content,
    required this.rating,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
