import 'package:equatable/equatable.dart';

class TvEvents extends Equatable{
  const TvEvents();
  @override
  List<Object?> get props => [];
}

class GetOnAirTvEvent extends TvEvents{}
class GetPopularTvEvent extends TvEvents{}
class GetTopRatedTvEvent extends TvEvents{}