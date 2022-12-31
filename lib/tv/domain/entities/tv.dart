import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final int id;
  final String? backdropPath;
  final List<int> genersId;
  final String name;
  final String posterPath;
  final String overView;
  final double voteAverage;
  final String firstAirDate;

  const Tv(
      {required this.id,
      this.backdropPath,
      required this.name,
      required this.genersId,
      required this.posterPath,
      required this.overView,
      required this.voteAverage,
      required this.firstAirDate});
  @override
  List<Object?> get props => [id, backdropPath, name, posterPath,overView,voteAverage,firstAirDate];
}
