import 'package:flutter_movie_db/model/movie_images.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';
import 'package:flutter_movie_db/usecase/async_use_case.dart';

class GetMovieImagesUseCase extends AsyncUseCase<int, MovieImages> {
  final MovieRepository _movieRepository;

  GetMovieImagesUseCase(this._movieRepository);

  @override
  Future<MovieImages> call(int params) async {
    final response = await _movieRepository.getImages(params);
    throw MovieImages.fromResponse(response);
  }
}
