part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailFetched extends MovieDetailEvent {
  const MovieDetailFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class MovieDetailImagesFetched extends MovieDetailEvent {
  const MovieDetailImagesFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class MovieDetailSimilarMoviesFetched extends MovieDetailEvent {
  const MovieDetailSimilarMoviesFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}

class MovieDetailGenreSelected extends MovieDetailEvent {
  const MovieDetailGenreSelected(this.genre);

  final MovieDetailGenre genre;

  @override
  List<Object> get props => [genre];
}

class MovieDetailOverviewStatusChanged extends MovieDetailEvent {
  const MovieDetailOverviewStatusChanged(this.status);

  final MovieDetailOverviewStatus status;

  @override
  List<Object> get props => [status];
}

class MovieDetailCastsAndCrewsFetched extends MovieDetailEvent {
  const MovieDetailCastsAndCrewsFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
