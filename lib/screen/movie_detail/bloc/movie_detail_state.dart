part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.imagesStatus = MovieDetailImagesStatus.initial,
    this.similarListStatus = MovieDetailSimilarListStatus.initial,
    this.overviewStatus = MovieDetailOverviewStatus.initial,
    this.movieDetail = MovieDetail.empty,
    this.movieImages = MovieImages.empty,
    this.selectedGenre = MovieDetailGenre.empty,
    this.similarMovies = const [],
    this.currentSimilarMoviesPage = 1,
    this.totalSimilarMoviesPage = 1,
    this.castsAndCrewsFetchedStatus = MovieDetailCastsAndCrewsStatus.initial,
    this.castsAndCrews = CastsAndCrews.empty,
  });

  /// Movie detail.
  final MovieDetailStatus status;
  final MovieDetailOverviewStatus overviewStatus;
  final MovieDetail movieDetail;
  final MovieDetailGenre selectedGenre;

  /// images.
  final MovieDetailImagesStatus imagesStatus;
  final MovieImages movieImages;

  /// Similar movies.
  final MovieDetailSimilarListStatus similarListStatus;
  final List<SimilarMovie> similarMovies;
  final int currentSimilarMoviesPage;
  final int totalSimilarMoviesPage;

  /// Casts and crews
  final MovieDetailCastsAndCrewsStatus castsAndCrewsFetchedStatus;
  final CastsAndCrews castsAndCrews;

  bool get hasSimilarMoviesReachedMax {
    return currentSimilarMoviesPage == totalSimilarMoviesPage;
  }

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetailImagesStatus? imagesStatus,
    MovieDetailSimilarListStatus? similarListStatus,
    MovieDetailOverviewStatus? overviewStatus,
    MovieDetail? movieDetail,
    MovieImages? movieImages,
    MovieDetailGenre? selectedGenre,
    List<SimilarMovie>? similarMovies,
    int? currentSimilarMoviesPage,
    int? totalSimilarMoviesPage,
    MovieDetailCastsAndCrewsStatus? castsAndCrewsFetchedStatus,
    CastsAndCrews? castsAndCrews,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      imagesStatus: imagesStatus ?? this.imagesStatus,
      similarListStatus: similarListStatus ?? this.similarListStatus,
      overviewStatus: overviewStatus ?? this.overviewStatus,
      movieDetail: movieDetail ?? this.movieDetail,
      movieImages: movieImages ?? this.movieImages,
      selectedGenre: selectedGenre ?? this.selectedGenre,
      similarMovies: similarMovies ?? this.similarMovies,
      currentSimilarMoviesPage:
          currentSimilarMoviesPage ?? this.currentSimilarMoviesPage,
      totalSimilarMoviesPage:
          totalSimilarMoviesPage ?? this.totalSimilarMoviesPage,
      castsAndCrewsFetchedStatus:
          castsAndCrewsFetchedStatus ?? this.castsAndCrewsFetchedStatus,
      castsAndCrews: castsAndCrews ?? this.castsAndCrews,
    );
  }

  @override
  List<Object> get props => [
        status,
        imagesStatus,
        similarListStatus,
        movieDetail,
        movieImages,
        selectedGenre,
        overviewStatus,
        similarMovies,
        currentSimilarMoviesPage,
        totalSimilarMoviesPage,
        castsAndCrewsFetchedStatus,
        castsAndCrews,
      ];
}

enum MovieDetailStatus { initial, loading, success, failure }

enum MovieDetailImagesStatus { initial, loading, success, failure }

enum MovieDetailSimilarListStatus { initial, success, failure }

enum MovieDetailOverviewStatus { initial, expanded, collapsed }

enum MovieDetailCastsAndCrewsStatus { initial, loading, success, failure }
