import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/tv/data/datasoures/tv_remote_data_source.dart';
import 'package:movies/tv/data/models/tv_mode.dart';
import 'package:movies/tv/domain/entities/tv.dart';
import 'package:movies/tv/domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDtatSource baseTvRemoteDtatSource;
  TvRepository(this.baseTvRemoteDtatSource);
  @override
  Future<Either<Failure, List<Tv>>> getOnAirTv() async {
    final result = await baseTvRemoteDtatSource.getBaseOnAirTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async{
   final result = await baseTvRemoteDtatSource.getBasePopularTv();
   try{
     return Right(result);
   }on ServerException catch(failure){
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async{
    final result = await baseTvRemoteDtatSource.getBaseTopRatedTv();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
