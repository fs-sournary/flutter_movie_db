part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailFetched extends MovieDetailEvent {
  final int id;

  const MovieDetailFetched(this.id);

  @override
  List<Object> get props => [id];
}

class MovieImagesFetched extends MovieDetailEvent {
  final int id;

  const MovieImagesFetched(this.id);

  @override
  List<Object> get props => [id];
}
