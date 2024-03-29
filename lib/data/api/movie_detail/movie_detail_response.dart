import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailResponse {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<MovieDetailGenreResponse>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<MovieDetailProductionCompanyResponse>? productionCompanies;
  final List<MovieDetailProductionCountryResponse>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<MovieDetailSpokenLanguageResponse>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetailResponse({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailGenreResponse {
  final int? id;
  final String? name;

  const MovieDetailGenreResponse({this.id, this.name});

  factory MovieDetailGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailGenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailGenreResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailProductionCompanyResponse {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const MovieDetailProductionCompanyResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory MovieDetailProductionCompanyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailProductionCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieDetailProductionCompanyResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailProductionCountryResponse {
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;

  const MovieDetailProductionCountryResponse({this.iso31661, this.name});

  factory MovieDetailProductionCountryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailProductionCountryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieDetailProductionCountryResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailSpokenLanguageResponse {
  @JsonKey(name: 'iso_639_1')
  final String? ios6391;
  final String? name;

  const MovieDetailSpokenLanguageResponse({this.ios6391, this.name});

  factory MovieDetailSpokenLanguageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailSpokenLanguageResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MovieDetailSpokenLanguageResponseToJson(this);
}
