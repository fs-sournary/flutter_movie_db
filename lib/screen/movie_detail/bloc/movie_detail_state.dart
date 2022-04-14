part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetailStatus status;
  final MovieDetail movieDetail;
  final MovieImages movieImages;

  const MovieDetailState({
    this.status = MovieDetailStatus.initial,
    this.movieDetail = MovieDetail.empty,
    this.movieImages = MovieImages.empty,
  });

  MovieDetailState copyWith({
    MovieDetailStatus? status,
    MovieDetail? movieDetail,
    MovieImages? movieImages,
  }) {
    return MovieDetailState(
      status: status ?? this.status,
      movieDetail: movieDetail ?? this.movieDetail,
      movieImages: movieImages ?? this.movieImages,
    );
  }

  @override
  List<Object> get props => [status, movieDetail, movieImages];
}

enum MovieDetailStatus {
  initial,
  getDetailLoading,
  getDetailSuccess,
  getDetailFailure,
  getImagesLoading,
  getImagesSuccess,
  getImagesFailure,
}
