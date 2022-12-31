import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/tv/domain/entities/tv.dart';

abstract class BaseTvRepository {
  Future<Either<Failure , List<Tv>>> getOnAirTv();
  Future<Either<Failure , List<Tv>>> getPopularTv();
  Future<Either<Failure , List<Tv>>> getTopRatedTv();
}