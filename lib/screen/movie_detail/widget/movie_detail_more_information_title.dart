import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailMoreInformationTitle extends StatelessWidget {
  const MovieDetailMoreInformationTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
          child: Text(
            S.current.movie_detail_more_information_title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        );
      },
    );
  }
}
