import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/model/casts_and_crews.dart';
import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:flutter_movie_db/model/movie_images.dart';
import 'package:flutter_movie_db/model/similar_movies.dart';
import 'package:flutter_movie_db/usecase/get_casts_and_crews_use_case.dart';
import 'package:flutter_movie_db/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_db/usecase/get_movie_images_use_case.dart';
import 'package:flutter_movie_db/usecase/get_similar_movies_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({
    required GetMovieDetailUseCase getMovieDetailUseCase,
    required GetMovieImagesUseCase getMovieImagesUseCase,
    required GetSimilarMoviesUseCase getSimilarMoviesUseCase,
    required GetCastsAndCrewsUseCase getCastsAndCrewsUseCase,
  })  : _getMovieDetailUseCase = getMovieDetailUseCase,
        _getMovieImagesUseCase = getMovieImagesUseCase,
        _getSimilarMoviesUseCase = getSimilarMoviesUseCase,
        _getCastsAndCrewsUseCase = getCastsAndCrewsUseCase,
        super(const MovieDetailState()) {
    on<MovieDetailFetched>(_onMovieDetailFetched);
    on<MovieDetailImagesFetched>(_onMovieDetailImagesFetched);
    on<MovieDetailGenreSelected>(_onMovieDetailGenreSelected);
    on<MovieDetailOverviewStatusChanged>(_onMovieDetailOverviewStatusChanged);
    on<MovieDetailSimilarMoviesFetched>(
      _onMovieDetailSimilarMoviesFetched,
      transformer: (events, mapper) =>
          events.debounce(const Duration(microseconds: 300)).switchMap(mapper),
    );
    on<MovieDetailCastsAndCrewsFetched>(_onCastsAndCrewsFetched);
  }

  final GetMovieDetailUseCase _getMovieDetailUseCase;
  final GetMovieImagesUseCase _getMovieImagesUseCase;
  final GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  final GetCastsAndCrewsUseCase _getCastsAndCrewsUseCase;

  static const _similarMoviesStartedPage = 1;

  Future<void> _onMovieDetailFetched(
    MovieDetailFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MovieDetailStatus.loading));
      final movieDetail = await _getMovieDetailUseCase.call(event.id);
      emit(state.copyWith(
          status: MovieDetailStatus.success, movieDetail: movieDetail));
    } catch (e) {
      emit(state.copyWith(status: MovieDetailStatus.failure));
    }
  }

  Future<void> _onMovieDetailImagesFetched(
    MovieDetailImagesFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(imagesStatus: MovieDetailImagesStatus.loading));
      final movieImages = await _getMovieImagesUseCase.call(event.id);
      emit(state.copyWith(
          imagesStatus: MovieDetailImagesStatus.success,
          movieImages: movieImages));
    } catch (e) {
      emit(state.copyWith(imagesStatus: MovieDetailImagesStatus.failure));
    }
  }

  Future<void> _onMovieDetailSimilarMoviesFetched(
    MovieDetailSimilarMoviesFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      // Load initial page
      if (state.similarListStatus == MovieDetailSimilarListStatus.initial) {
        final params = GetSimilarMoviesUseCaseParams(
          id: event.id,
          page: _similarMoviesStartedPage,
        );
        final similarMovies = await _getSimilarMoviesUseCase.call(params);
        return emit(state.copyWith(
            similarListStatus: MovieDetailSimilarListStatus.success,
            similarMovies: similarMovies.results,
            currentSimilarMoviesPage: _similarMoviesStartedPage,
            totalSimilarMoviesPage: similarMovies.totalPages));
      }
      // Load more similar movies
      if (state.hasSimilarMoviesReachedMax) return;
      final queryPage = state.currentSimilarMoviesPage + 1;
      final params =
          GetSimilarMoviesUseCaseParams(id: event.id, page: queryPage);
      final similarMovies = await _getSimilarMoviesUseCase.call(params);
      emit(state.copyWith(
        similarListStatus: MovieDetailSimilarListStatus.success,
        similarMovies: List.of(state.similarMovies)
          ..addAll(similarMovies.results),
        currentSimilarMoviesPage: queryPage,
      ));
    } catch (e) {
      emit(state.copyWith(
          similarListStatus: MovieDetailSimilarListStatus.failure));
    }
  }

  void _onMovieDetailGenreSelected(
    MovieDetailGenreSelected event,
    Emitter<MovieDetailState> emit,
  ) {
    emit(state.copyWith(selectedGenre: event.genre));
  }

  void _onMovieDetailOverviewStatusChanged(
    MovieDetailOverviewStatusChanged event,
    Emitter<MovieDetailState> emit,
  ) {
    emit(state.copyWith(overviewStatus: event.status));
  }

  Future<void> _onCastsAndCrewsFetched(
    MovieDetailCastsAndCrewsFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(
          castsAndCrewsFetchedStatus: MovieDetailCastsAndCrewsStatus.loading));
      final castsAndCrews = await _getCastsAndCrewsUseCase.call(event.id);
      emit(state.copyWith(
          castsAndCrewsFetchedStatus: MovieDetailCastsAndCrewsStatus.success,
          castsAndCrews: castsAndCrews));
    } catch (e) {
      emit(state.copyWith(
          castsAndCrewsFetchedStatus: MovieDetailCastsAndCrewsStatus.initial));
    }
  }
}
