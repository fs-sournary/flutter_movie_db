import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:flutter_movie_db/model/movie_images.dart';
import 'package:flutter_movie_db/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_db/usecase/get_movie_images_use_case.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;
  final GetMovieImagesUseCase _getMovieImagesUseCase;

  MovieDetailBloc(this._getMovieDetailUseCase, this._getMovieImagesUseCase)
      : super(const MovieDetailState()) {
    on<MovieDetailFetched>(_onMovieDetailFetched);
    on<MovieImagesFetched>(_onMovieImagesFetched);
  }

  Future<void> _onMovieDetailFetched(
    MovieDetailFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MovieDetailStatus.getDetailLoading));
      final movieDetail = await _getMovieDetailUseCase.call(event.id);
      emit(state.copyWith(
          status: MovieDetailStatus.getDetailSuccess,
          movieDetail: movieDetail));
    } catch (e) {
      emit(state.copyWith(status: MovieDetailStatus.getDetailFailure));
    }
  }

  Future<void> _onMovieImagesFetched(
    MovieImagesFetched event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MovieDetailStatus.getImagesLoading));
      final movieImages = await _getMovieImagesUseCase.call(event.id);
      emit(state.copyWith(
          status: MovieDetailStatus.getImagesSuccess,
          movieImages: movieImages));
    } catch (e) {
      emit(state.copyWith(status: MovieDetailStatus.getImagesFailure));
    }
  }
}
