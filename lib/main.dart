import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/app.dart';
import 'package:flutter_movie_db/app_bloc_observer.dart';
import 'package:flutter_movie_db/di/bloc_di.dart';
import 'package:flutter_movie_db/di/data_course_di.dart';
import 'package:flutter_movie_db/di/repository_di.dart';
import 'package:flutter_movie_db/di/use_case_di.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();
  await Future.wait([
     setupDataSourceDependencies(),
     setupRepositoryDependencies(),
     setupUseCaseDependencies(),
     setupBlocDependencies(),
  ]);
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}
