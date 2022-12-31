import 'package:dartz/dartz.dart';
import 'package:movies/core/error/falier.dart';
import 'package:movies/tv/domain/entities/tv.dart';
import 'package:movies/tv/domain/repository/base_tv_repository.dart';

class GetOnAirTvUseCase {
  BaseTvRepository baseTvRepository;
  GetOnAirTvUseCase(this.baseTvRepository);

  Future<Either<Failure , List<Tv>>> call()async{
    return await baseTvRepository.getOnAirTv();

  }
}