
import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvents extends Equatable{
  const MovieDetailsEvents();
}

class GetMovieDetailsEvent extends MovieDetailsEvents{
  final int id ;
  const GetMovieDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class GetRecommendationMoviesEvent extends MovieDetailsEvents{
  final int id;
  const GetRecommendationMoviesEvent({required this.id});

  @override
  List<Object?> get props => [id];
}