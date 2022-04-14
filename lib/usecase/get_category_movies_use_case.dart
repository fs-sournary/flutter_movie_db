import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';
import 'package:flutter_movie_db/usecase/async_use_case.dart';

class GetCategoryMoviesUseCase
    extends AsyncUseCase<GetCategoryMovieUseCaseParams, CategoryMovies> {
  final MovieRepository _movieRepository;

  GetCategoryMoviesUseCase(this._movieRepository);

  @override
  Future<CategoryMovies> call(GetCategoryMovieUseCaseParams params) async {
    final response =
        await _movieRepository.getCategoryMovies(params.category, params.page);
    return CategoryMovies.fromResponse(response);
  }
}

class GetCategoryMovieUseCaseParams {
  final String category;
  final int page;

  const GetCategoryMovieUseCaseParams({
    required this.category,
    required this.page,
  });
}
