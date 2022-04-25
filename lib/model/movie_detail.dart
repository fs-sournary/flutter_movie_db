import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  const MovieDetail({
    this.adult = false,
    this.backdropPath = '',
    this.budget = 0,
    this.genres = const [],
    this.homepage = '',
    this.id = 0,
    this.imdbId = '',
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.releaseDate = '',
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  static const empty = MovieDetail();

  final bool adult;
  final String backdropPath;
  final int budget;
  final List<MovieDetailGenre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<MovieDetailProductionCompany> productionCompanies;
  final List<MovieDetailProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<MovieDetailSpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount
      ];
}

class MovieDetailGenre extends Equatable {
  const MovieDetailGenre({this.id = 0, this.name = ''});

  static const empty = MovieDetailGenre();

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class MovieDetailProductionCompany extends Equatable {
  const MovieDetailProductionCompany({
    this.id = 0,
    this.logoPath = '',
    this.name = '',
    this.originCountry = '',
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  @override
  List<Object> get props => [id, logoPath, name, originCountry];
}

class MovieDetailProductionCountry extends Equatable {
  const MovieDetailProductionCountry({this.iso31661 = '', this.name = ''});

  final String iso31661;
  final String name;

  @override
  List<Object> get props => [iso31661, name];
}

class MovieDetailSpokenLanguage extends Equatable {
  const MovieDetailSpokenLanguage({
    this.ios6391 = '',
    this.name = '',
    this.englishName = '',
  });

  final String ios6391;
  final String name;
  final String englishName;

  @override
  List<Object> get props => [ios6391, name, englishName];
}
