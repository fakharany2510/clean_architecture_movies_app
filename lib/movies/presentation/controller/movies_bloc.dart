import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';
import 'package:movies/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase , this.getTopRatedMoviesUseCase) : super(const MoviesStates()) {
   ///Now Playing Movies
    on<GetNowPlayingEvents>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase();
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
                nowPlayingMoviesState: RequestState.loaded,
                nowPlayingMovies: r,
              )));
    });
    ///Popular Movies
  on<GetPopularMoviesEvents>((event , emit)async{
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMoviesState: RequestState.error,
          popularMessage: l.message
        )
      ),
      (r) => emit(
        state.copyWith(
          popularMoviesState: RequestState.loaded,
          popularMovies: r
        )
      ),
    );
  });
  ///Top Rated Movies
  on<GetTopRatedMoviesEvents>((event , emit)async{
    final result = await getTopRatedMoviesUseCase();
    print('${result}');
    result.fold((l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedMoviesState: RequestState.error,
        )
    ), (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedMoviesState: RequestState.loaded,
        )
    ));
  });
  }
}
