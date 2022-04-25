import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/storage/storage_data_source.dart';
import 'package:flutter_movie_db/utils/logger.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor(this._storageDataSource);

  final StorageDataSource _storageDataSource;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final userToken = await _storageDataSource.getUserToken();
    if (userToken.isNotEmpty) {
      options.headers['Authorization'] = userToken;
    }
    options.queryParameters['api_key'] = 'd107661962965284a68ab916fb8bd204';
    AppLogger.logDebug('API request [${options.method}]: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.logDebug(
        'API response [${response.statusCode}]: ${response.requestOptions.path}');
    AppLogger.logDebug(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppLogger.logError(
        'API error [${err.response?.statusCode}]: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
