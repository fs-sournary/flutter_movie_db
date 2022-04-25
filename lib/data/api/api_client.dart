import 'package:dio/dio.dart';
import 'package:flutter_movie_db/data/api/api_interceptor.dart';
import 'package:flutter_movie_db/data/api/casts_and_crews/casts_and_crews_response.dart';
import 'package:flutter_movie_db/data/api/category_movies/category_movies_response.dart';
import 'package:flutter_movie_db/data/api/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_db/data/api/movie_images/movie_images_response.dart';
import 'package:flutter_movie_db/data/api/similar_movies/similar_movies_response.dart';

class ApiClient {
  ApiClient(this._apiInterceptor, this._dio) {
    _dio.interceptors.add(_apiInterceptor);
  }

  final ApiInterceptor _apiInterceptor;
  final Dio _dio;

  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const receiveTimeout = 2 * 60 * 1000;
  static const sendTimeout = 2 * 60 * 1000;
  static const connectTimeout = 2 * 60 * 1000;

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
    final response = await _dio.get('movie/$id/images');
    return MovieImagesResponse.fromJson(response.data);
  }

  Future<SimilarMoviesResponse> getSimilarMovies(int id, int page) async {
    final response = await _dio.get(
      'movie/$id/similar',
      queryParameters: {'page': page},
    );
    return SimilarMoviesResponse.fromJson(response.data);
  }

  Future<CastsAndCrewsResponse> getMovieCastsAndCrews(int movieId) async {
    final response = await _dio.get('movie/$movieId/credits');
    return CastsAndCrewsResponse.fromJson(response.data);
  }
}
