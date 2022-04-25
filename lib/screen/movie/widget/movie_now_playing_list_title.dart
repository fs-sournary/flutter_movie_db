import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';

class MovieNowPlayingListTitle extends StatelessWidget {
  const MovieNowPlayingListTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) => current.nowPlayingMovies.isNotEmpty,
      builder: (context, state) {
        if (state.nowPlayingMovies.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.current.home_now_playing_title,
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
