import 'package:gamepedia/models/game.dart';

var gameList = [
  Game(
    title: 'Valorant',
    developer: 'Riot Games',
    releaseDate: DateTime(2020,06,02) ,
    price: 1,
    avaible: 'PC',
    genre: 'FPS',
    description: 'game rusak',
    screenShots: [
      'https://media-cdn.tripadvisor.com/media/photo-o/11/cd/4f/71/borobudur-and-the-sky.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/cd/5d/36/borobudur-airial-view.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/cd/4d/c7/borobudur-and-the-sky.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/cd/47/0e/borobudur-sunset-moment.jpg',
    ],
    isFavorite: false,
  ),
];