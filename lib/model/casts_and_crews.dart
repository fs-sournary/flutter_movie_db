import 'package:equatable/equatable.dart';

class CastsAndCrews extends Equatable {
  const CastsAndCrews({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  static const empty = CastsAndCrews();

  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  @override
  List<Object> get props => [id, cast, crew];
}

class Cast extends Equatable {
  const Cast({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.castId = 0,
    this.character = '',
    this.creditId = '',
    this.order = 0,
  });

  static const empty = Cast();

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  @override
  List<Object> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order
      ];
}

class Crew extends Equatable {
  const Crew({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.creditId = '',
    this.department = '',
    this.job = '',
  });
  
  static const empty = Crew();

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String creditId;
  final String department;
  final String job;

  @override
  List<Object> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        creditId,
        department,
        job,
      ];
}
