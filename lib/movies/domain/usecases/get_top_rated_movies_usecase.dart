///3

import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMoviesUseCase{
   BaseMovieRepository baseMovieRepository;
  GetTopRatedMoviesUseCase(this.baseMovieRepository);


  ///you will use this function in presentation to get popular movies
   Future<Either<Failure , List<Movie>>> call()async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}