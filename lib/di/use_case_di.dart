import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/usecase/get_category_movies_use_case.dart';
import 'package:flutter_movie_db/usecase/get_movie_detail_use_case.dart';
import 'package:flutter_movie_db/usecase/get_movie_images_use_case.dart';

Future<void> setupUseCaseDependencies() async {
  getIt.registerLazySingleton(() => GetCategoryMoviesUseCase(getIt()));

  getIt.registerLazySingleton(() => GetMovieDetailUseCase(getIt()));

  getIt.registerLazySingleton(() => GetMovieImagesUseCase(getIt()));
}
