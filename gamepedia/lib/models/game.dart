class Game {
  final String title;
  final String developer;
  final DateTime releaseDate;
  final int price;
  final String avaible;
  final String genre;
  final String description;
  final String imageAssets;
  final List<String> screenShots;
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
    this.isFavorite = false,
    required this.imageAssets,
  });
}
