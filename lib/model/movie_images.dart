import 'package:equatable/equatable.dart';

class MovieImages extends Equatable {
  const MovieImages({
    this.id = 0,
    this.backdrops = const [],
    this.posters = const [],
  });

  static const empty = MovieImages();

  final int id;
  final List<MovieImagesBackdrop> backdrops;
  final List<MovieImagesPoster> posters;

  @override
  List<Object?> get props => [id, backdrops, posters];
}

class MovieImagesBackdrop extends Equatable {
  const MovieImagesBackdrop({
    this.aspectRatio = 0.0,
    this.filePath = '',
    this.height = 0,
    this.iso6391 = '',
    this.voteAverage = 0,
    this.voteCount = 0,
    this.width = 0,
  });

  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final double voteAverage;
  final int voteCount;
  final int width;

  @override
  List<Object?> get props =>
      [aspectRatio, filePath, height, iso6391, voteAverage, voteCount, width];
}

class MovieImagesPoster extends Equatable {
  const MovieImagesPoster({
    this.aspectRatio = 0.0,
    this.filePath = '',
    this.height = 0,
    this.iso6391 = '',
    this.voteAverage = 0,
    this.voteCount = 0,
    this.width = 0,
  });

  final double aspectRatio;
  final String filePath;
  final int height;
  final String iso6391;
  final double voteAverage;
  final int voteCount;
  final int width;

  @override
  List<Object?> get props =>
      [aspectRatio, filePath, height, iso6391, voteAverage, voteCount, width];
}
