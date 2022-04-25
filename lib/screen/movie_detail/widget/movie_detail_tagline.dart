import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/utils/color.dart';

class MovieDetailTagline extends StatelessWidget {
  const MovieDetailTagline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.tagline != current.movieDetail.tagline;
      },
      builder: (context, state) {
        final tagline = state.movieDetail.tagline;
        if (tagline.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
          child: Text(
            tagline,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: greyishTwo),
          ),
        );
      },
    );
  }
}
