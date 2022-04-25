import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_movies_response.g.dart';

@JsonSerializable()
class CategoryMoviesResponse {
  const CategoryMoviesResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory CategoryMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryMoviesResponseFromJson(json);

  final CategoryMovieDateResponse? dates;
  final int? page;
  final List<CategoryMovieResponse>? results;
  final int? totalPages;
  final int? totalResults;

  Map<String, dynamic> toJson() => _$CategoryMoviesResponseToJson(this);

  CategoryMovies toModel() => CategoryMovies(
        page: page ?? 0,
        results: results?.map((e) => e.toModel()).toList() ?? [],
        totalPages: totalPages ?? 0,
        totalResults: totalResults ?? 0,
      );
}

@JsonSerializable()
class CategoryMovieDateResponse {
  const CategoryMovieDateResponse({this.maximum, this.minimum});

  factory CategoryMovieDateResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryMovieDateResponseFromJson(json);

  final String? maximum;
  final String? minimum;

  Map<String, dynamic> toJson() => _$CategoryMovieDateResponseToJson(this);
}

@JsonSerializable()
class CategoryMovieResponse {
  const CategoryMovieResponse({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory CategoryMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryMovieResponseFromJson(json);

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Map<String, dynamic> toJson() => _$CategoryMovieResponseToJson(this);

  CategoryMovie toModel() => CategoryMovie(
        adult: adult ?? false,
        backdropPath: backdropPath ?? '',
        genreIds: genreIds ?? [],
        id: id ?? 0,
        originalLanguage: originalLanguage ?? '',
        originalTitle: originalTitle ?? '',
        overview: overview ?? '',
        popularity: popularity ?? 0,
        posterPath: posterPath ?? '',
        releaseDate: releaseDate ?? '',
        title: title ?? '',
        video: video ?? false,
        voteAverage: voteAverage ?? 0,
        voteCount: voteCount ?? 0,
      );
}
