import 'package:movies/core/network/error_message_model.dart';

/// this class for remote data exception
class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});

}

/// this class for local data exception
class LocalDataException implements Exception{
  final String errorMessage;

  LocalDataException({required this.errorMessage});

}