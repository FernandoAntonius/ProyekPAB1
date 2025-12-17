class Game {
  final String title;
  final String developer;
  final DateTime releaseDate;
  final double rating;
  final double price;
  final List<String> device;
  final List<String> genre;
  final String description;
  final String imageAssets;
  final List<String> screenShots;
  final Map<String, Map<String, String>> systemRequirements;
  bool isFavorite;

  Game({
    required this.title,
    required this.developer,
    required this.releaseDate,
    required this.price,
    required this.device,
    required this.genre,
    required this.description,
    required this.screenShots,
    required this.systemRequirements,
    this.isFavorite = false,
    required this.imageAssets,
    required this.rating,
  
  });
}
