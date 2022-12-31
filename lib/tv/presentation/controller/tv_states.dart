import 'package:equatable/equatable.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/tv/domain/entities/tv.dart';

class TvStates extends Equatable {
  final List<Tv> onAirTv;
  final RequestState onAirTvStates;
  final String onAirMessage;
  final List<Tv> popularTv;
  final RequestState popularTvStates;
  final String popularMessage;
  final List<Tv> topRatedTv;
  final RequestState topRatedTvStates;
  final String topRatedMessage;

  const TvStates({
    this.onAirTv = const [],
    this.onAirTvStates = RequestState.loading,
    this.onAirMessage = '',
    this.popularTv = const [],
    this.popularTvStates = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTv = const [],
    this.topRatedTvStates = RequestState.loading,
    this.topRatedMessage = '',
  });

  TvStates copyWith({
    final List<Tv>? onAirTv,
    final RequestState? onAirTvStates,
    final String? onAirMessage,
    final List<Tv>? popularTv,
    final RequestState? popularTvStates,
    final String? popularMessage,
    final List<Tv>? topRatedTv,
    final RequestState? topRatedTvStates,
    final String? topRatedMessage,
}){
    return TvStates(
      onAirTv: onAirTv ?? this.onAirTv,
      onAirTvStates: onAirTvStates ?? this.onAirTvStates,
      onAirMessage: onAirMessage?? this.onAirMessage,
      popularTv: popularTv ?? this.popularTv,
      popularTvStates: popularTvStates?? this.popularTvStates,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      topRatedTvStates:  topRatedTvStates ?? this.topRatedTvStates,
      topRatedMessage:  topRatedMessage ?? this.topRatedMessage
    );
  }

  @override
  List<Object?> get props => [
        onAirTv,
        onAirTvStates,
        onAirMessage,
        popularTv,
        popularTvStates,
        popularMessage,
        topRatedTv,
        topRatedTvStates,
        topRatedMessage
      ];
}
