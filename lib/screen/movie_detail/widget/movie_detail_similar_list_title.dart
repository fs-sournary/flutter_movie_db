import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailSimilarListTitle extends StatelessWidget {
  const MovieDetailSimilarListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) => current.similarMovies.isNotEmpty,
      builder: (context, state) {
        if (state.similarMovies.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Text(
            S.current.movie_detail_similar_list_title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}
