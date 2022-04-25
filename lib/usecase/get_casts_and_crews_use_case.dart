import 'dart:async';

import 'package:flutter_movie_db/model/casts_and_crews.dart';
import 'package:flutter_movie_db/repository/movie_repository.dart';
import 'package:flutter_movie_db/usecase/async_use_case.dart';

class GetCastsAndCrewsUseCase extends AsyncUseCase<int, CastsAndCrews> {
  final MovieRepository _movieRepository;

  GetCastsAndCrewsUseCase(this._movieRepository);

  @override
  Future<CastsAndCrews> call(int params) async {
    final response = await _movieRepository.getCastsAndCrews(params);
    return response.toModel();
  }
}
