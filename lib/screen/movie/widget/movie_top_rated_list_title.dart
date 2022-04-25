import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';

class MovieTopRatedListTitle extends StatelessWidget {
  const MovieTopRatedListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) => current.topRatedMovies.isNotEmpty,
      builder: (context, state) {
        if (state.topRatedMovies.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 20, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.current.home_top_rated_title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(S.current.home_view_all_action),
              ),
            ],
          ),
        );
      },
    );
  }
}
