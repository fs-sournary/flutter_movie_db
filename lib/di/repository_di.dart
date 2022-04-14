import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/repository/authentication_repository.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';

Future<void> setupRepositoryDependencies() async {
  getIt.registerLazySingleton(() => MovieRepository(getIt()));

  getIt.registerLazySingleton(() => AuthenticationRepository());
}
