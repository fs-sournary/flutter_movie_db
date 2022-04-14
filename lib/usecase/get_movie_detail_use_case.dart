import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';
import 'package:flutter_movie_db/usecase/async_use_case.dart';

class GetMovieDetailUseCase extends AsyncUseCase<int, MovieDetail> {
  final MovieRepository _movieRepository;

  GetMovieDetailUseCase(this._movieRepository);

  @override
  Future<MovieDetail> call(int params) async {
    final response = await _movieRepository.getDetail(params);
    return MovieDetail.fromResponse(response);
  }
}
