import 'package:flutter_movie_db/model/similar_movies.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';
import 'package:flutter_movie_db/usecase/async_use_case.dart';

class GetSimilarMoviesUseCase
    extends AsyncUseCase<GetSimilarMoviesUseCaseParams, SimilarMovies> {
  final MovieRepository _movieRepository;

  GetSimilarMoviesUseCase(this._movieRepository);

  @override
  Future<SimilarMovies> call(GetSimilarMoviesUseCaseParams params) async {
    final response =
        await _movieRepository.getSimilarMovies(params.id, params.page);
    return response.toModel();
  }
}

class GetSimilarMoviesUseCaseParams {
  final int id;
  final int page;

  const GetSimilarMoviesUseCaseParams({required this.id, required this.page});
}
