import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailPage extends StatelessWidget {
  static const name = "/movie_detail";

  static Route route(int movieId) =>
      MaterialPageRoute(builder: (_) => MovieDetailPage(movieId: movieId));

  final int movieId;

  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailBloc>()
        ..add(MovieDetailFetched(movieId))
        ..add(MovieImagesFetched(movieId)),
      child: _View(movieId: movieId),
    );
  }
}

class _View extends StatelessWidget {
  final int movieId;

  const _View({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Text(state.movieDetail.title);
      },
    );
  }
}
