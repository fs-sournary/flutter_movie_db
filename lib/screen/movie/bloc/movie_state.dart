part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final MovieStatus status;
  final CategoryMovies nowPlayingCategoryMovies;
  final CategoryMovies popularCategoryMovies;
  final CategoryMovies topRatedCategoryMovies;
  final CategoryMovies upcomingCategoryMovies;

  const MovieState({
    this.status = MovieStatus.initial,
    this.nowPlayingCategoryMovies = CategoryMovies.empty,
    this.popularCategoryMovies = CategoryMovies.empty,
    this.topRatedCategoryMovies = CategoryMovies.empty,
    this.upcomingCategoryMovies = CategoryMovies.empty,
  });

  MovieState copyWith({
    MovieStatus? status,
    CategoryMovies? nowPlayingCategoryMovies,
    CategoryMovies? popularCategoryMovies,
    CategoryMovies? topRatedCategoryMovies,
    CategoryMovies? upcomingCategoryMovies,
  }) {
    return MovieState(
      status: status ?? this.status,
      nowPlayingCategoryMovies:
          nowPlayingCategoryMovies ?? this.nowPlayingCategoryMovies,
      popularCategoryMovies:
          popularCategoryMovies ?? this.popularCategoryMovies,
      topRatedCategoryMovies:
          topRatedCategoryMovies ?? this.topRatedCategoryMovies,
      upcomingCategoryMovies:
          upcomingCategoryMovies ?? this.upcomingCategoryMovies,
    );
  }

  @override
  List<Object> get props => [
        status,
        nowPlayingCategoryMovies,
        popularCategoryMovies,
        topRatedCategoryMovies,
        upcomingCategoryMovies
      ];
}

enum MovieStatus { initial, loading, success, failure }
