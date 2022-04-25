part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieLatestFetched extends MovieEvent {
  const MovieLatestFetched();
}

class MovieNowPlayingFetched extends MovieEvent {
  const MovieNowPlayingFetched();
}

class MoviePopularFetched extends MovieEvent {
  const MoviePopularFetched();
}

class MovieTopRatedFetched extends MovieEvent {
  const MovieTopRatedFetched();
}

class MovieUpcomingFetched extends MovieEvent {
  const MovieUpcomingFetched();
}

class MovieDetailFetched extends MovieEvent {
  const MovieDetailFetched(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
