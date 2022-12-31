import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMoviesUsecase {
  BaseMovieRepository baseMovieRepository;
  GetRecommendationMoviesUsecase(this.baseMovieRepository);
  Future<Either<Failure , List<Recommendation>>> call(int movieId) async{
    return await baseMovieRepository.getRecommendationMovies(movieId);
  }
}