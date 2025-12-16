class Game {
  final String title;
  final String developer;
  final DateTime releaseDate;
  final String rating;
  final double price;
  final List<String> avaible;
  final List<String> genre;
  final String description;
  final String imageAssets;
  final List<String> screenShots;
  final Map<String, Map<String, String>> systemRequirements;
  bool newRelease;
  bool isFavorite;

  Game({
    required this.title,
    required this.developer,
    required this.releaseDate,
    required this.price,
    required this.avaible,
    required this.genre,
    required this.description,
    required this.screenShots,
    required this.systemRequirements,
    this.isFavorite = false,
    required this.imageAssets,
    this.newRelease = false,
    required this.rating,
  });
}
