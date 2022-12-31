import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utls/enums.dart';
import 'package:movies/tv/domain/usecases/get_on_air_tv_usecase.dart';
import 'package:movies/tv/domain/usecases/get_popular_tv_usecase.dart';
import 'package:movies/tv/domain/usecases/get_top_rated_tv_usecase.dart';
import 'package:movies/tv/presentation/controller/tv_events.dart';
import 'package:movies/tv/presentation/controller/tv_states.dart';

class TvBloc extends Bloc<TvEvents, TvStates> {
  final GetOnAirTvUseCase getOnAirTvUseCase;
  final GetPopularTvUseCse getPopularTvUseCse;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;
  TvBloc(this.getOnAirTvUseCase, this.getPopularTvUseCse,
      this.getTopRatedTvUseCase)
      : super(const TvStates()) {
    on<GetOnAirTvEvent>((event, emit) async {
      ///on air
      final result = await getOnAirTvUseCase();
      result.fold(
          (l) => emit(state.copyWith(
              onAirTvStates: RequestState.error, onAirMessage: l.message)),
          (r) => emit(
              state.copyWith(onAirTvStates: RequestState.loaded, onAirTv: r)));
    });

    ///popular tv
    on<GetPopularTvEvent>((event, emit) async {
      final result = await getPopularTvUseCse();
      result.fold(
          (l) => emit(state.copyWith(
              popularTvStates: RequestState.error, popularMessage: l.message)),
          (r) => emit(state.copyWith(
              popularTvStates: RequestState.loaded, popularTv: r)));
    });

    ///top rated tv
    on<GetTopRatedTvEvent>((event, emit) async {
      print('1+${state}');
      final result = await getTopRatedTvUseCase();
      print('2+${state}');
      result.fold(
          (l) => emit(state.copyWith(
              topRatedTvStates: RequestState.error, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedTvStates: RequestState.loaded, topRatedTv: r)));
    });
    print('4+${state}');
  }
}
