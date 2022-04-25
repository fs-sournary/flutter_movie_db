import 'package:flutter_movie_db/model/tv_category_type.dart';

extension TvCategoryTypeExtension on TvCategoryType {
  String get pageName {
    switch (this) {
      case TvCategoryType.latest:
        return '/latest';
      case TvCategoryType.tvAiringToday:
        return '/tv_airing_today';
      case TvCategoryType.tvOnTheAir:
        return '/tv_on_the_air';
      case TvCategoryType.popular:
        return '/popular';
      default:
        return '/upcoming';
    }
  }
}
