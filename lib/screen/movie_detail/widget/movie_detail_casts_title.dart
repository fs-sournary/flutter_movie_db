import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailCastsTitle extends StatelessWidget {
  const MovieDetailCastsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) => current.castsAndCrews.cast.isNotEmpty,
      builder: (context, state) {
        final casts = state.castsAndCrews.cast;
        if (casts.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Text(
            S.current.movie_detail_casts_title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}
