import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_details_event.dart';
import 'package:movies/movies/presentation/controller/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUsecase;
  MovieDetailsBloc(
      this.getMovieDetailsUsecase, this.getRecommendationMoviesUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      print('1${state}');
      final result = await getMovieDetailsUsecase(event.id);
      print('2${state}');
      result.fold(
          (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message)),
          (r) => emit(state.copyWith(
                movieDetailsState: RequestState.loaded,
                moveDetail: r,
              )));
    });
    on<GetRecommendationMoviesEvent>((event, emit) async {
      final result = await getRecommendationMoviesUsecase(event.id);
      result.fold(
          (l) => (state.copyWith(
              recommendationState: RequestState.error,
              recommendationMessage: l.message)),
          (r) =>
          (state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded))
      );
    });
  }
}
