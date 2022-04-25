import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/usecase/get_category_movies_use_case.dart';

extension MovieCategoryTypeExtension on MovieCategoryType {
  GetCategoryMovieUseCaseParams getParams({int page = 1}) {
    var query = '';
    switch (this) {
      case MovieCategoryType.nowPlaying:
        query = 'now_playing';
        break;
      case MovieCategoryType.popular:
        query = 'popular';
        break;
      case MovieCategoryType.topRated:
        query = 'top_rated';
        break;
      default:
        query = 'upcoming';
        break;
    }
    return GetCategoryMovieUseCaseParams(category: query, page: page);
  }

  String get pageName {
    switch (this) {
      case MovieCategoryType.latest:
        return '/latest';
      case MovieCategoryType.nowPlaying:
        return '/now_playing';
      case MovieCategoryType.popular:
        return '/popular';
      case MovieCategoryType.topRated:
        return 'top_rated';
      default:
        return '/upcoming';
    }
  }
}
