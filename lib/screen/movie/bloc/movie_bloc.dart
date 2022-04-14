import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/usecase/get_category_movies_use_case.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetCategoryMoviesUseCase _getNowPlayingMoviesUseCase;

  MovieBloc(this._getNowPlayingMoviesUseCase) : super(const MovieState()) {
    on<MovieCategoryFetched>(_onMovieCategoryFetched);
  }

  Future<void> _onMovieCategoryFetched(
    MovieCategoryFetched event,
    Emitter<MovieState> emit,
  ) async {
    try {
      emit(state.copyWith(status: MovieStatus.loading));
      final categoryMovies = await Future.wait([
        _getNowPlayingMoviesUseCase.call(MovieCategoryType.nowPlaying.params),
        _getNowPlayingMoviesUseCase.call(MovieCategoryType.popular.params),
        _getNowPlayingMoviesUseCase.call(MovieCategoryType.topRated.params),
        _getNowPlayingMoviesUseCase.call(MovieCategoryType.upcoming.params),
      ]);
      emit(state.copyWith(
        status: MovieStatus.success,
        nowPlayingCategoryMovies: categoryMovies[0],
        popularCategoryMovies: categoryMovies[1],
        topRatedCategoryMovies: categoryMovies[2],
        upcomingCategoryMovies: categoryMovies[3],
      ));
    } catch (e) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }
}

enum MovieCategoryType { nowPlaying, popular, topRated, upcoming }

extension on MovieCategoryType {
  GetCategoryMovieUseCaseParams get params {
    var query = '';
    switch (this) {
      case MovieCategoryType.nowPlaying:
        query = 'now_playing';
        break;
      case MovieCategoryType.popular:
        query = 'popular';
        break;
      case MovieCategoryType.topRated:
        query = 'top_rated';
        break;
      default:
        query = 'upcoming';
        break;
    }
    return GetCategoryMovieUseCaseParams(category: query, page: 1);
  }
}
