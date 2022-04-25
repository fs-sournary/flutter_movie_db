import 'package:flutter_movie_db/model/movie_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_images_response.g.dart';

@JsonSerializable()
class MovieImagesResponse {
  const MovieImagesResponse({
    this.id,
    this.backdrops,
    this.posters,
  });

  factory MovieImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesResponseFromJson(json);

  final int? id;
  final List<MovieImagesBackdropResponse>? backdrops;
  final List<MovieImagesPosterResponse>? posters;

  Map<String, dynamic> toJson() => _$MovieImagesResponseToJson(this);

  MovieImages toModel() => MovieImages(
        id: id ?? 0,
        backdrops: backdrops?.map((e) => e.toModel()).toList() ?? [],
        posters: posters?.map((e) => e.toModel()).toList() ?? [],
      );
}

@JsonSerializable()
class MovieImagesBackdropResponse {
  const MovieImagesBackdropResponse({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory MovieImagesBackdropResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesBackdropResponseFromJson(json);

  final double? aspectRatio;
  final String? filePath;
  final int? height;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  Map<String, dynamic> toJson() => _$MovieImagesBackdropResponseToJson(this);

  MovieImagesBackdrop toModel() => MovieImagesBackdrop(
        aspectRatio: aspectRatio ?? 0.0,
        filePath: filePath ?? '',
        height: height ?? 0,
        iso6391: iso6391 ?? '',
        voteAverage: voteAverage ?? 0,
        voteCount: voteCount ?? 0,
        width: width ?? 0,
      );
}

@JsonSerializable()
class MovieImagesPosterResponse {
  const MovieImagesPosterResponse({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory MovieImagesPosterResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesPosterResponseFromJson(json);

  final double? aspectRatio;
  final String? filePath;
  final int? height;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  Map<String, dynamic> toJson() => _$MovieImagesPosterResponseToJson(this);

  MovieImagesPoster toModel() => MovieImagesPoster(
        aspectRatio: aspectRatio ?? 0.0,
        filePath: filePath ?? '',
        height: height ?? 0,
        iso6391: iso6391 ?? '',
        voteAverage: voteAverage ?? 0,
        voteCount: voteCount ?? 0,
        width: width ?? 0,
      );
}
