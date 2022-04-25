import 'package:flutter_movie_db/model/similar_movies.dart';
import 'package:json_annotation/json_annotation.dart';

part 'similar_movies_response.g.dart';

@JsonSerializable()
class SimilarMoviesResponse {
  const SimilarMoviesResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarMoviesResponseFromJson(json);

  final int? page;
  final List<SimilarMovieResponse>? results;
  final int? totalPages;
  final int? totalResults;

  Map<String, dynamic> toJson() => _$SimilarMoviesResponseToJson(this);

  SimilarMovies toModel() => SimilarMovies(
        page: page ?? 0,
        results: results?.map((e) => e.toModel()).toList() ?? [],
        totalPages: totalPages ?? 0,
        totalResults: totalResults ?? 0,
      );
}

@JsonSerializable()
class SimilarMovieResponse {
  const SimilarMovieResponse({
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

  factory SimilarMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarMovieResponseFromJson(json);

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

  Map<String, dynamic> toJson() => _$SimilarMovieResponseToJson(this);

  SimilarMovie toModel() => SimilarMovie(
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
