import 'package:flutter_movie_db/data/api/api_client.dart';
import 'package:flutter_movie_db/data/api/category_movies/category_movies_response.dart';
import 'package:flutter_movie_db/data/api/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_db/data/api/movie_images/movie_images_response.dart';

class MovieRepository {
  final ApiClient _apiClient;

  MovieRepository(this._apiClient);

  Future<CategoryMoviesResponse> getCategoryMovies(
    String category,
    int page,
  ) async {
    return await _apiClient.getCategoryMovies(category, page);
  }

  Future<MovieDetailResponse> getDetail(int id) async {
    return await _apiClient.getMovieDetail(id);
  }

  Future<MovieImagesResponse> getImages(int id) async {
    return await _apiClient.getMovieImages(id);
  }
}
