import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/screen/setting/bloc/setting_bloc.dart';

Future<void> setupBlocDependencies() async {
  getIt.registerFactory(() => MovieBloc(getIt(), getIt()));

  getIt.registerFactory(() => MovieDetailBloc(
        getMovieDetailUseCase: getIt(),
        getMovieImagesUseCase: getIt(),
        getSimilarMoviesUseCase: getIt(),
        getCastsAndCrewsUseCase: getIt(),
      ));

  getIt.registerFactory(() => HomeBloc());

  getIt.registerFactory(() => SettingBloc());
}
