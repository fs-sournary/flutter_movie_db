import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/api/api_interceptor.dart';
import 'package:flutter_movie_db/data/api/category_movies/category_movies_response.dart';
import 'package:flutter_movie_db/data/api/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_db/data/api/movie_images/movie_images_response.dart';

class ApiClient {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const receiveTimeout = 2 * 60 * 1000;
  static const sendTimeout = 2 * 60 * 1000;
  static const connectTimeout = 2 * 60 * 1000;

  final ApiInterceptor _apiInterceptor;
  final Dio _dio;

  ApiClient(this._apiInterceptor, this._dio) {
    _dio.interceptors.add(_apiInterceptor);
  }

  Future<CategoryMoviesResponse> getCategoryMovies(
    String category,
    int page,
  ) async {
    final response = await _dio.get(
      'movie/$category',
      queryParameters: {'page': page},
    );
    return CategoryMoviesResponse.fromJson(response.data);
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await _dio.get('movie/$id');
    return MovieDetailResponse.fromJson(response.data);
  }

  Future<MovieImagesResponse> getMovieImages(int id) async {
    final response = await _dio.get('tv/$id/images');
    return MovieImagesResponse.fromJson(response.data);
  }
}
