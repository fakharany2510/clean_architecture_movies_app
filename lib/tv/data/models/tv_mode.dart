import 'package:movies/tv/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel(
      {required super.id,
      super.backdropPath,
      required super.name,
      required super.genersId,
      required super.posterPath,
      required super.overView,
      required super.voteAverage,
      required super.firstAirDate});

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      name: json['name'],
      genersId: List<int>.from(json['genre_ids'].map((e) => e)),
      posterPath: json['poster_path'],
      overView: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      firstAirDate: json['first_air_date']);
}
