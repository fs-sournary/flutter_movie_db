import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailTitle extends StatelessWidget {
  const MovieDetailTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.title != current.movieDetail.title;
      },
      builder: (context, state) {
        final title = state.movieDetail.title;
        if (title.isEmpty) {
          return Container();
        }
        final textTheme = Theme.of(context).textTheme;
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Text(
            title,
            style: textTheme.titleLarge?.copyWith(height: 1.4),
          ),
        );
      },
    );
  }
}
