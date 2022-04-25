part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState({
    this.selectedCategoryType = MovieCategoryType.latest,
    this.movieLatestStatus = MovieLatestStatus.initial,
    this.latestMovies = const [],
    this.currentLatestMoviesPage = 0,
    this.totalLatestMoviesPage = 0,
    this.movieNowPlayingStatus = MovieNowPlayingStatus.initial,
    this.nowPlayingMovies = const [],
    this.currentNowPlayingMoviesPage = 0,
    this.totalNowPlayingMoviesPage = 0,
    this.moviePopularStatus = MoviePopularStatus.initial,
    this.popularMovies = const [],
    this.currentPopularMoviesPage = 0,
    this.totalPopularMoviesPage = 0,
    this.movieTopRatedStatus = MovieTopRatedStatus.initial,
    this.topRatedMovies = const [],
    this.currentTopRatedMoviesPage = 0,
    this.totalTopRatedMoviesPage = 0,
    this.movieUpcomingStatus = MovieUpcomingStatus.initial,
    this.upcomingMovies = const [],
    this.currentUpcomingMoviesPage = 0,
    this.totalUpcomingMoviesPage = 0,
    this.movieSelectedStatus = MovieSelectedStatus.initial,
    this.selectedMovie = MovieDetail.empty,
  });

  final MovieCategoryType selectedCategoryType;

  /// States and data of latest movies.
  final MovieLatestStatus movieLatestStatus;
  final List<CategoryMovie> latestMovies;
  final int currentLatestMoviesPage;
  final int totalLatestMoviesPage;

  /// States and data of now playing movies.
  final MovieNowPlayingStatus movieNowPlayingStatus;
  final List<CategoryMovie> nowPlayingMovies;
  final int currentNowPlayingMoviesPage;
  final int totalNowPlayingMoviesPage;

  /// States and data of popular movies.
  final MoviePopularStatus moviePopularStatus;
  final List<CategoryMovie> popularMovies;
  final int currentPopularMoviesPage;
  final int totalPopularMoviesPage;

  /// States and data of top rated movies.
  final MovieTopRatedStatus movieTopRatedStatus;
  final List<CategoryMovie> topRatedMovies;
  final int currentTopRatedMoviesPage;
  final int totalTopRatedMoviesPage;

  /// State and data of upcoming movies
  final MovieUpcomingStatus movieUpcomingStatus;
  final List<CategoryMovie> upcomingMovies;
  final int currentUpcomingMoviesPage;
  final int totalUpcomingMoviesPage;

  /// State and data of selected movie
  final MovieSelectedStatus movieSelectedStatus;
  final MovieDetail selectedMovie;

  bool get isLatestMoviesReachMax {
    return currentLatestMoviesPage == totalLatestMoviesPage;
  }

  bool get isNowPlayingMoviesReachMax {
    return currentNowPlayingMoviesPage == totalNowPlayingMoviesPage;
  }

  bool get isPopularMoviesReachMax {
    return currentPopularMoviesPage == totalPopularMoviesPage;
  }

  bool get isTopRatedMoviesReachMax {
    return currentTopRatedMoviesPage == totalTopRatedMoviesPage;
  }

  bool get isUpcomingMoviesReachMax {
    return currentUpcomingMoviesPage == totalUpcomingMoviesPage;
  }

  MovieState copyWith({
    MovieCategoryType? selectedCategoryType,
    MovieLatestStatus? movieLatestStatus,
    List<CategoryMovie>? latestMovies,
    int? currentLatestMoviesPage,
    int? totalLatestMoviesPage,
    MovieNowPlayingStatus? movieNowPlayingStatus,
    List<CategoryMovie>? nowPlayingMovies,
    int? currentNowPlayingMoviesPage,
    int? totalNowPlayingMoviesPage,
    MoviePopularStatus? moviePopularStatus,
    List<CategoryMovie>? popularMovies,
    int? currentPopularMoviesPage,
    int? totalPopularMoviesPage,
    MovieTopRatedStatus? movieTopRatedStatus,
    List<CategoryMovie>? topRatedMovies,
    int? currentTopRatedMoviesPage,
    int? totalTopRatedMoviesPage,
    MovieUpcomingStatus? movieUpcomingStatus,
    List<CategoryMovie>? upcomingMovies,
    int? currentUpcomingMoviesPage,
    int? totalUpcomingMoviesPage,
    MovieSelectedStatus? movieSelectedStatus,
    MovieDetail? selectedMovie,
  }) {
    return MovieState(
      selectedCategoryType: selectedCategoryType ?? this.selectedCategoryType,
      movieLatestStatus: movieLatestStatus ?? this.movieLatestStatus,
      latestMovies: latestMovies ?? this.latestMovies,
      currentLatestMoviesPage:
          currentLatestMoviesPage ?? this.currentLatestMoviesPage,
      totalLatestMoviesPage:
          totalLatestMoviesPage ?? this.totalLatestMoviesPage,
      movieNowPlayingStatus:
          movieNowPlayingStatus ?? this.movieNowPlayingStatus,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      currentNowPlayingMoviesPage:
          currentNowPlayingMoviesPage ?? this.currentNowPlayingMoviesPage,
      totalNowPlayingMoviesPage:
          totalNowPlayingMoviesPage ?? this.totalNowPlayingMoviesPage,
      moviePopularStatus: moviePopularStatus ?? this.moviePopularStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      currentPopularMoviesPage:
          currentPopularMoviesPage ?? this.currentPopularMoviesPage,
      totalPopularMoviesPage:
          totalPopularMoviesPage ?? this.totalPopularMoviesPage,
      movieTopRatedStatus: movieTopRatedStatus ?? this.movieTopRatedStatus,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      currentTopRatedMoviesPage:
          currentTopRatedMoviesPage ?? this.currentTopRatedMoviesPage,
      totalTopRatedMoviesPage:
          totalTopRatedMoviesPage ?? this.totalTopRatedMoviesPage,
      movieUpcomingStatus: movieUpcomingStatus ?? this.movieUpcomingStatus,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      currentUpcomingMoviesPage:
          currentUpcomingMoviesPage ?? this.currentUpcomingMoviesPage,
      totalUpcomingMoviesPage:
          totalUpcomingMoviesPage ?? this.totalUpcomingMoviesPage,
      movieSelectedStatus: movieSelectedStatus ?? this.movieSelectedStatus,
      selectedMovie: selectedMovie ?? this.selectedMovie,
    );
  }

  @override
  List<Object> get props => [
        selectedCategoryType,
        movieLatestStatus,
        latestMovies,
        currentLatestMoviesPage,
        totalLatestMoviesPage,
        movieNowPlayingStatus,
        nowPlayingMovies,
        currentNowPlayingMoviesPage,
        totalNowPlayingMoviesPage,
        moviePopularStatus,
        popularMovies,
        currentPopularMoviesPage,
        totalPopularMoviesPage,
        movieTopRatedStatus,
        topRatedMovies,
        currentTopRatedMoviesPage,
        totalTopRatedMoviesPage,
        movieUpcomingStatus,
        upcomingMovies,
        currentUpcomingMoviesPage,
        totalUpcomingMoviesPage,
        movieSelectedStatus,
        selectedMovie,
      ];
}

enum MovieLatestStatus { initial, loading, success, failure }

enum MovieNowPlayingStatus { initial, loading, success, failure }

enum MoviePopularStatus { initial, loading, success, failure }

enum MovieTopRatedStatus { initial, loading, success, failure }

enum MovieUpcomingStatus { initial, loading, success, failure }

enum MovieSelectedStatus { initial, loading, success, failure }
