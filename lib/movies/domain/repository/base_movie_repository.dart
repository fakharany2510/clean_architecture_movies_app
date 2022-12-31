///2
import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_details.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';

///here you will add which you want to show in the screen you will add to your app
///this file have no impelementaion of methods just contract

abstract class BaseMovieRepository{
  ///this method for get now playing movies
  Future<Either<Failure , List<Movie>>> getNowPlaying();
  ///this method for get popular playing movies
  Future<Either<Failure , List<Movie>>> getPopularMovies();
  ///this method for get top rated movies
  Future<Either<Failure , List<Movie>>>getTopRatedMovies();
  ///this method for get movie details
  Future<Either<Failure , MovieDetails>>getMovieDetails(int movieId);
  ///this method for get recommendation movie
  Future<Either<Failure , List<Recommendation>>>getRecommendationMovies(int movieId);
}