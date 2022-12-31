import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.title,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.voteAverage});
 factory MovieDetailsModel.fromJson(Map<String , dynamic> json)=> MovieDetailsModel(
     backdropPath: json['backdrop_path'],
     id: json['id'],
     title: json['title'],
     genres: List<GenresModel>.from(json['genres'].map((x)=>GenresModel.fromJson(x))),
     overview: json['overview'],
     releaseDate: json['release_date'],
     runtime: json['runtime'],
     voteAverage: json['vote_average'].toDouble());
}
