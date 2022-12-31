import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasoures/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movies_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/movie_details_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/tv/data/datasoures/tv_remote_data_source.dart';
import 'package:movies/tv/data/repository/tv_repository.dart';
import 'package:movies/tv/domain/repository/base_tv_repository.dart';
import 'package:movies/tv/domain/usecases/get_on_air_tv_usecase.dart';
import 'package:movies/tv/domain/usecases/get_popular_tv_usecase.dart';
import 'package:movies/tv/domain/usecases/get_top_rated_tv_usecase.dart';
import 'package:movies/tv/presentation/controller/tv_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///block
    ///معني الريجيستر فاكتوري انك اول ماتسنخدم البلوك اعمل اوبجيكت جديد كل مره
    sl.registerFactory(() => MoviesBloc(sl() , sl() , sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl() , sl()));
    sl.registerFactory(() => TvBloc(sl() , sl() , sl()));
    ///use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUsecase(sl()));
    ///tv
    sl.registerLazySingleton(() => GetOnAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCse(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));
    ///Data Source
    ///معني الريجيستر ليزي سنجل تون انك متستخدمش الاوبجيكت غير لما ننده عليه
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseTvRemoteDtatSource>(
            () => TvRemoteDataSource());
  }
}
