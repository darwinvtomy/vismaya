import 'package:meta/meta.dart';

class Vismaya {
  Vismaya({
    required this.name,
    required this.logo,
    required this.movies,
  });

  final String name;
  final String logo;
  final List<Movie> movies;
}

class Movie {
  Movie({
    required this.movieID,
    required this.title,
    required this.portrateThumbnail,
    required this.trailerUrl,
    required this.landscapeThumbnail,
    required this.discription,
    required this.genere,
    required this.languages,
    this.price,
    required this.directors,
    required this.starCast,
    required this.releaseDate,
  });

  final String title;
  final int movieID;
  final String portrateThumbnail;
  final String landscapeThumbnail;
  final String trailerUrl;
  final String discription;
  final List<String> genere;
  final List<String> languages;
  final double? price;
  final List<String> directors;
  final List<String> starCast;
  final String releaseDate;
}
