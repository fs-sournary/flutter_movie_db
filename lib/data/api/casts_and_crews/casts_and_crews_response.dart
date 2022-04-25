import 'package:flutter_movie_db/model/casts_and_crews.dart';
import 'package:json_annotation/json_annotation.dart';

part 'casts_and_crews_response.g.dart';

@JsonSerializable()
class CastsAndCrewsResponse {
  const CastsAndCrewsResponse({this.id, this.cast, this.crew});

  factory CastsAndCrewsResponse.fromJson(Map<String, dynamic> json) =>
      _$CastsAndCrewsResponseFromJson(json);

  final int? id;
  final List<CastResponse>? cast;
  final List<CrewResponse>? crew;

  Map<String, dynamic> toJson() => _$CastsAndCrewsResponseToJson(this);

  CastsAndCrews toModel() => CastsAndCrews(
        id: id ?? 0,
        cast: cast?.map((e) => e.toModel()).toList() ?? [],
        crew: crew?.map((e) => e.toModel()).toList() ?? [],
      );
}

@JsonSerializable()
class CastResponse {
  const CastResponse({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  Map<String, dynamic> toJson() => _$CastResponseToJson(this);

  Cast toModel() => Cast(
        adult: adult ?? false,
        gender: gender ?? 0,
        id: id ?? 0,
        knownForDepartment: knownForDepartment ?? '',
        name: name ?? '',
        originalName: originalName ?? '',
        popularity: popularity ?? 0,
        profilePath: profilePath ?? '',
        castId: castId ?? 0,
        character: character ?? '',
        creditId: creditId ?? '',
        order: order ?? 0,
      );
}

@JsonSerializable()
class CrewResponse {
  const CrewResponse({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory CrewResponse.fromJson(Map<String, dynamic> json) =>
      _$CrewResponseFromJson(json);

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  Map<String, dynamic> toJson() => _$CrewResponseToJson(this);

  Crew toModel() => Crew(
        adult: adult ?? false,
        gender: gender ?? 0,
        id: id ?? 0,
        knownForDepartment: knownForDepartment ?? '',
        name: name ?? '',
        originalName: originalName ?? '',
        popularity: popularity ?? 0.0,
        profilePath: profilePath ?? '',
        creditId: creditId ?? '',
        department: department ?? '',
        job: job ?? '',
      );
}
