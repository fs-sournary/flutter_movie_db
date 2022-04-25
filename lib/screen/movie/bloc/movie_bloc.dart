import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:flutter_movie_db/usecase/get_category_movies_use_case.dart';
import 'package:flutter_movie_db/extension/movie_category_type_extension.dart';
import 'package:flutter_movie_db/usecase/get_movie_detail_use_case.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(
    this._getCategoryMoviesUseCase,
    this._getMovieDetailUseCase,
  ) : super(const MovieState()) {
    on<MovieLatestFetched>(_onMovieLatestFetched);
    on<MovieNowPlayingFetched>(_onMovieNowPlayingFetched);
    on<MovieTopRatedFetched>(_onMovieTopRatedFetched);
    on<MoviePopularFetched>(_onMoviePopularFetched);
    on<MovieUpcomingFetched>(_onMovieUpcomingFetched);
    on<MovieDetailFetched>(_onMovieDetailFetched);
  }

  final GetCategoryMoviesUseCase _getCategoryMoviesUseCase;
  final GetMovieDetailUseCase _getMovieDetailUseCase;

  Future<void> _onMovieLatestFetched(
    MovieLatestFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      // Load initial movies
      if (state.movieLatestStatus == MovieLatestStatus.initial) {
        final params = MovieCategoryType.latest.getParams();
        final result = await _getCategoryMoviesUseCase.call(params);
        final movies = result.results;
        emit(state.copyWith(
            movieLatestStatus: MovieLatestStatus.success,
            latestMovies: movies,
            currentLatestMoviesPage: 1,
            totalLatestMoviesPage: result.totalPages));
        // Load first movie if result movies aren't empty.
        if (movies.isNotEmpty) add(MovieDetailFetched(movies[0].id));
        return;
      }
      if (state.isLatestMoviesReachMax) return;
      // Load more movies
      final queryPage = state.currentLatestMoviesPage + 1;
      final params = MovieCategoryType.latest.getParams(page: queryPage);
      final movies = await _getCategoryMoviesUseCase.call(params);
      emit(state.copyWith(
          movieLatestStatus: MovieLatestStatus.success,
          latestMovies: List.of(state.latestMovies)..addAll(movies.results),
          currentLatestMoviesPage: queryPage));
    } catch (e) {
      emit(state.copyWith(movieLatestStatus: MovieLatestStatus.failure));
    }
  }

  Future<void> _onMovieNowPlayingFetched(
    MovieNowPlayingFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      // Load initial movies
      if (state.movieNowPlayingStatus == MovieNowPlayingStatus.initial) {
        final params = MovieCategoryType.nowPlaying.getParams();
        final result = await _getCategoryMoviesUseCase.call(params);
        final movies = result.results;
        emit(state.copyWith(
            movieNowPlayingStatus: MovieNowPlayingStatus.success,
            nowPlayingMovies: movies,
            currentNowPlayingMoviesPage: 1,
            totalNowPlayingMoviesPage: result.totalPages));
        return;
      }
      if (state.isNowPlayingMoviesReachMax) return;
      final queryPage = state.currentNowPlayingMoviesPage + 1;
      final params = MovieCategoryType.nowPlaying.getParams(page: queryPage);
      final result = await _getCategoryMoviesUseCase.call(params);
      emit(state.copyWith(
          movieNowPlayingStatus: MovieNowPlayingStatus.success,
          nowPlayingMovies: List.of(state.nowPlayingMovies)
            ..addAll(result.results),
          currentNowPlayingMoviesPage: queryPage));
    } catch (e) {
      emit(
          state.copyWith(movieNowPlayingStatus: MovieNowPlayingStatus.failure));
    }
  }

  Future<void> _onMovieTopRatedFetched(
    MovieTopRatedFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      // Load initial movies
      if (state.movieTopRatedStatus == MovieTopRatedStatus.initial) {
        final params = MovieCategoryType.topRated.getParams();
        final result = await _getCategoryMoviesUseCase.call(params);
        final movies = result.results;
        emit(state.copyWith(
            movieTopRatedStatus: MovieTopRatedStatus.success,
            topRatedMovies: movies,
            currentTopRatedMoviesPage: 1,
            totalTopRatedMoviesPage: result.totalPages));
        return;
      }
      if (state.isTopRatedMoviesReachMax) return;
      final queryPage = state.currentTopRatedMoviesPage + 1;
      final params = MovieCategoryType.topRated.getParams(page: queryPage);
      final result = await _getCategoryMoviesUseCase.call(params);
      emit(state.copyWith(
          movieTopRatedStatus: MovieTopRatedStatus.success,
          topRatedMovies: List.of(state.topRatedMovies)..addAll(result.results),
          currentTopRatedMoviesPage: queryPage));
    } catch (e) {
      emit(state.copyWith(movieTopRatedStatus: MovieTopRatedStatus.failure));
    }
  }

  Future<void> _onMoviePopularFetched(
    MoviePopularFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state.moviePopularStatus == MoviePopularStatus.initial) {
        final params = MovieCategoryType.popular.getParams();
        final result = await _getCategoryMoviesUseCase.call(params);
        final movies = result.results;
        emit(state.copyWith(
            moviePopularStatus: MoviePopularStatus.success,
            popularMovies: movies,
            currentPopularMoviesPage: 1,
            totalPopularMoviesPage: result.totalPages));
        return;
      }
      if (state.isPopularMoviesReachMax) return;
      final queryPage = state.currentPopularMoviesPage + 1;
      final params = MovieCategoryType.popular.getParams(page: queryPage);
      final result = await _getCategoryMoviesUseCase.call(params);
      emit(state.copyWith(
          moviePopularStatus: MoviePopularStatus.success,
          popularMovies: List.of(state.popularMovies)..addAll(result.results),
          currentPopularMoviesPage: queryPage));
    } catch (e) {
      emit(state.copyWith(moviePopularStatus: MoviePopularStatus.failure));
    }
  }

  Future<void> _onMovieUpcomingFetched(
    MovieUpcomingFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      // Load initial page
      if (state.movieUpcomingStatus == MovieUpcomingStatus.initial) {
        final params = MovieCategoryType.upcoming.getParams();
        final result = await _getCategoryMoviesUseCase.call(params);
        final movies = result.results;
        emit(state.copyWith(
            movieUpcomingStatus: MovieUpcomingStatus.success,
            upcomingMovies: movies,
            currentUpcomingMoviesPage: 1,
            totalUpcomingMoviesPage: result.totalPages));
        return;
      }
      if (state.isUpcomingMoviesReachMax) return;
      final queryPage = state.currentUpcomingMoviesPage + 1;
      final params = MovieCategoryType.upcoming.getParams(page: queryPage);
      final result = await _getCategoryMoviesUseCase.call(params);
      emit(state.copyWith(
          movieUpcomingStatus: MovieUpcomingStatus.success,
          upcomingMovies: List.of(state.upcomingMovies)..addAll(result.results),
          currentUpcomingMoviesPage: queryPage));
    } catch (e) {
      emit(state.copyWith(movieUpcomingStatus: MovieUpcomingStatus.failure));
    }
  }

  Future<void> _onMovieDetailFetched(
    MovieDetailFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      emit(state.copyWith(movieSelectedStatus: MovieSelectedStatus.loading));
      final movie = await _getMovieDetailUseCase.call(event.id);
      emit(state.copyWith(
          movieSelectedStatus: MovieSelectedStatus.success,
          selectedMovie: movie));
    } catch (e) {
      emit(state.copyWith(movieSelectedStatus: MovieSelectedStatus.failure));
    }
  }
}
