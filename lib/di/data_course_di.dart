import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/api/api_client.dart';
import 'package:flutter_movie_db/data/api/api_interceptor.dart';
import 'package:flutter_movie_db/data/storage/storage_data_source.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> setupDataSourceDependencies() async {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());

  getIt.registerLazySingleton(() => ApiInterceptor(getIt()));

  getIt.registerLazySingleton(() => Dio(BaseOptions(
        baseUrl: ApiClient.baseUrl,
        receiveTimeout: ApiClient.receiveTimeout,
        sendTimeout: ApiClient.sendTimeout,
        connectTimeout: ApiClient.connectTimeout,
      )));

  getIt.registerLazySingleton(() => StorageDataSource(getIt()));

  getIt.registerLazySingleton(() => ApiClient(getIt(), getIt()));
}
