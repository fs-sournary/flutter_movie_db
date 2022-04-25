import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
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

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);

  MovieDetail toModel() => MovieDetail(
        adult: adult ?? false,
        backdropPath: backdropPath ?? '',
        budget: budget ?? 0,
        genres: genres?.map((e) => e.toModel()).toList() ?? [],
        homepage: homepage ?? '',
        id: id ?? 0,
        imdbId: imdbId ?? '',
        originalLanguage: originalLanguage ?? '',
        originalTitle: originalTitle ?? '',
        overview: overview ?? '',
        popularity: popularity ?? 0.0,
        posterPath: posterPath ?? '',
        productionCompanies:
            productionCompanies?.map((e) => e.toModel()).toList() ?? [],
        productionCountries:
            productionCountries?.map((e) => e.toModel()).toList() ?? [],
        releaseDate: releaseDate ?? '',
        revenue: revenue ?? 0,
        runtime: runtime ?? 0,
        spokenLanguages:
            spokenLanguages?.map((e) => e.toModel()).toList() ?? [],
        status: status ?? '',
        tagline: tagline ?? '',
        title: title ?? '',
        video: video ?? false,
        voteAverage: voteAverage ?? 0.0,
        voteCount: voteCount ?? 0,
      );
}

@JsonSerializable()
class MovieDetailGenreResponse {
  const MovieDetailGenreResponse({this.id, this.name});

  factory MovieDetailGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailGenreResponseFromJson(json);

  final int? id;
  final String? name;

  Map<String, dynamic> toJson() => _$MovieDetailGenreResponseToJson(this);

  MovieDetailGenre toModel() => MovieDetailGenre(id: id ?? 0, name: name ?? '');
}

@JsonSerializable()
class MovieDetailProductionCompanyResponse {
  const MovieDetailProductionCompanyResponse({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory MovieDetailProductionCompanyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailProductionCompanyResponseFromJson(json);

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  Map<String, dynamic> toJson() =>
      _$MovieDetailProductionCompanyResponseToJson(this);

  MovieDetailProductionCompany toModel() => MovieDetailProductionCompany(
        id: id ?? 0,
        logoPath: logoPath ?? '',
        name: name ?? '',
        originCountry: originCountry ?? '',
      );
}

@JsonSerializable()
class MovieDetailProductionCountryResponse {
  const MovieDetailProductionCountryResponse({this.iso31661, this.name});

  factory MovieDetailProductionCountryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailProductionCountryResponseFromJson(json);

  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;

  Map<String, dynamic> toJson() =>
      _$MovieDetailProductionCountryResponseToJson(this);

  MovieDetailProductionCountry toModel() =>
      MovieDetailProductionCountry(iso31661: iso31661 ?? '', name: name ?? '');
}

@JsonSerializable()
class MovieDetailSpokenLanguageResponse {
  const MovieDetailSpokenLanguageResponse({
    this.ios6391,
    this.name,
    this.englishName,
  });

  factory MovieDetailSpokenLanguageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$MovieDetailSpokenLanguageResponseFromJson(json);

  @JsonKey(name: 'iso_639_1')
  final String? ios6391;
  final String? name;
  final String? englishName;

  Map<String, dynamic> toJson() =>
      _$MovieDetailSpokenLanguageResponseToJson(this);

  MovieDetailSpokenLanguage toModel() => MovieDetailSpokenLanguage(
        ios6391: ios6391 ?? '',
        name: name ?? '',
        englishName: englishName ?? '',
      );
}
