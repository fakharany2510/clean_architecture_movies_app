import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUsecase{
  BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUsecase(this.baseMovieRepository);


  Future<Either<Failure , MovieDetails>> call(int movieId) async{
    return await baseMovieRepository.getMovieDetails(movieId);
  }
}