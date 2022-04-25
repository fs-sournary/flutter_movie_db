import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailSpokenLanguageTitle extends StatelessWidget {
  const MovieDetailSpokenLanguageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return current.movieDetail.spokenLanguages.isNotEmpty;
      },
      builder: (context, state) {
        if (state.movieDetail.spokenLanguages.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Text(
            S.current.movie_detail_subtitles,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        );
      },
    );
  }
}
