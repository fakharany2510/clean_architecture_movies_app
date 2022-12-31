import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/geners.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final String title;
  final int runtime;
  final double voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
  });
  @override
  List<Object?> get props =>
      [backdropPath, title, id, overview, releaseDate, runtime, voteAverage];
}
