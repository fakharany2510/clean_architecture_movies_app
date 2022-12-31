import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/tv/data/models/tv_mode.dart';

///this is th conteract
abstract class BaseTvRemoteDtatSource {
  Future<List<TvModel>> getBaseOnAirTv();
  Future<List<TvModel>> getBasePopularTv();
  Future<List<TvModel>> getBaseTopRatedTv();
}

class TvRemoteDataSource extends BaseTvRemoteDtatSource {
  @override
  Future<List<TvModel>> getBaseOnAirTv() async {
    final response = await Dio().get(ApiConstance.onAirTvBath);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<TvModel>> getBasePopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvBath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<TvModel>> getBaseTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvBath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
