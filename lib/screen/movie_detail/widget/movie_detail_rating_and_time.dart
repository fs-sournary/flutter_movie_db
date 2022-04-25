import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/widget/rating_bar.dart';

class MovieDetailRatingAndTime extends StatelessWidget {
  const MovieDetailRatingAndTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
      child: Row(
        children: const [
          _VoteAverage(),
          _VoteAverageAndReleaseDateSeparator(),
          _ReleaseDate(),
          _ReleaseDateAndRuntimeSeparator(),
          Expanded(child: _Runtime()),
        ],
      ),
    );
  }
}

class _VoteAverage extends StatelessWidget {
  const _VoteAverage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) =>
          previous.movieDetail.voteAverage != current.movieDetail.voteAverage,
      builder: (context, state) {
        final voteAverage = state.movieDetail.voteAverage;
        if (voteAverage == 0) {
          return Container();
        }
        return Row(
          children: [
            Text(
              voteAverage.toString(),
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: RatingBar(rating: voteAverage),
            ),
          ],
        );
      },
    );
  }
}

class _VoteAverageAndReleaseDateSeparator extends StatelessWidget {
  const _VoteAverageAndReleaseDateSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        final previousMovieDetail = previous.movieDetail;
        final currentMovieDetail = current.movieDetail;
        return previousMovieDetail.voteAverage !=
                currentMovieDetail.voteAverage ||
            previousMovieDetail.releaseDate != currentMovieDetail.releaseDate;
      },
      builder: (context, state) {
        final movieDetail = state.movieDetail;
        if (movieDetail.voteAverage == 0 || movieDetail.releaseDate.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(S.current.dot_separator),
        );
      },
    );
  }
}

class _ReleaseDate extends StatelessWidget {
  const _ReleaseDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) =>
          previous.movieDetail.releaseDate != current.movieDetail.releaseDate,
      builder: (context, state) {
        final releaseDate = state.movieDetail.releaseDate;
        if (releaseDate.isEmpty) {
          return Container();
        }
        return Text(
          releaseDate,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
        );
      },
    );
  }
}

class _ReleaseDateAndRuntimeSeparator extends StatelessWidget {
  const _ReleaseDateAndRuntimeSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        final previousMovieDetail = previous.movieDetail;
        final currentMovieDetail = current.movieDetail;
        return previousMovieDetail.releaseDate !=
                currentMovieDetail.releaseDate ||
            previousMovieDetail.runtime != currentMovieDetail.runtime;
      },
      builder: (context, state) {
        final movieDetail = state.movieDetail;
        if (movieDetail.releaseDate.isEmpty && movieDetail.runtime == 0) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(S.current.dot_separator),
        );
      },
    );
  }
}

class _Runtime extends StatelessWidget {
  const _Runtime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.runtime != current.movieDetail.runtime;
      },
      builder: (context, state) {
        final runtime = state.movieDetail.runtime;
        if (runtime == 0) {
          return Container();
        }
        return Text(
          runtime.runtimeText,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
        );
      },
    );
  }
}

extension on int {
  String get runtimeText {
    final hour = (this / 60).floor();
    final minute = this % 60;
    return '$hour ${S.current.short_hour} $minute ${S.current.short_minute}';
  }
}
