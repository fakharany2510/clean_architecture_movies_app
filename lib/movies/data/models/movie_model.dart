///4

import 'package:movies/movies/domain/entities/movie.dart';

/// TODO : this is movie model class
class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.posterPath,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String , dynamic> json)=> MovieModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      posterPath: json["poster_path"],
      ///TODO : CHECK THIS
      voteAverage: json["vote_average"].toDouble(),
      releaseDate: json["release_date"]
  );
}
