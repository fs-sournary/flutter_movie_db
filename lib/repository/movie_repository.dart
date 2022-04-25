import 'package:flutter_movie_db/data/api/api_client.dart';
import 'package:flutter_movie_db/data/api/casts_and_crews/casts_and_crews_response.dart';
import 'package:flutter_movie_db/data/api/category_movies/category_movies_response.dart';
import 'package:flutter_movie_db/data/api/movie_detail/movie_detail_response.dart';
import 'package:flutter_movie_db/data/api/movie_images/movie_images_response.dart';
import 'package:flutter_movie_db/data/api/similar_movies/similar_movies_response.dart';

class MovieRepository {
  MovieRepository(this._apiClient);

  final ApiClient _apiClient;

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

  Future<SimilarMoviesResponse> getSimilarMovies(int id, int page) async {
    return await _apiClient.getSimilarMovies(id, page);
  }

  Future<CastsAndCrewsResponse> getCastsAndCrews(int id) async {
    return await _apiClient.getMovieCastsAndCrews(id);
  }
}
