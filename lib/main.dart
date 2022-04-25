import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app.dart';
import 'package:flutter_movie_db/app_bloc_observer.dart';
import 'package:flutter_movie_db/di/bloc_di.dart';
import 'package:flutter_movie_db/di/data_course_di.dart';
import 'package:flutter_movie_db/di/repository_di.dart';
import 'package:flutter_movie_db/di/use_case_di.dart';
Future<void> main() async {
  await Future.wait([
     setupDataSourceDependencies(),
     setupRepositoryDependencies(),
     setupUseCaseDependencies(),
     setupBlocDependencies(),
  ]);
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}
