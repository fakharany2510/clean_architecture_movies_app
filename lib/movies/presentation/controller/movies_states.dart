import 'package:equatable/equatable.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/domain/entities/movie.dart';

class MoviesStates extends Equatable{
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlayingMovies =const [],
    this.nowPlayingMoviesState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies =const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovies =const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMessage = '',
});

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMessage,
}){
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState: nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
  @override
  List<Object?> get props => [
    nowPlayingMovies ,
    nowPlayingMoviesState ,
    nowPlayingMessage,
    popularMovies ,
    popularMoviesState ,
    popularMessage,
   topRatedMovies ,
   topRatedMoviesState ,
   topRatedMessage,
  ];

}