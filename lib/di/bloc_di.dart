import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

Future<void> setupBlocDependencies() async {
  getIt.registerFactory(() => MovieBloc(getIt()));

  getIt.registerFactory(() => MovieDetailBloc(getIt(), getIt()));
}
