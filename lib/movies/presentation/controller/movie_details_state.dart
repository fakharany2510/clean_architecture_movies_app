import 'package:equatable/equatable.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? moveDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState(
      {this.moveDetail,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = "",
      this.recommendation = const [],
      this.recommendationState = RequestState.loading,
      this.recommendationMessage = ""});

  MovieDetailsState copyWith({
    MovieDetails? moveDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        moveDetail: moveDetail ?? this.moveDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        recommendation: recommendation ?? this.recommendation,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage,
        recommendationState: recommendationState ?? this.recommendationState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        moveDetail,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationMessage,
        recommendationState
      ];
}
