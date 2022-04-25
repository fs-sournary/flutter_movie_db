import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/utils/color.dart';

class MovieDetailOverview extends StatelessWidget {
  const MovieDetailOverview({Key? key}) : super(key: key);

  static const _maxLines = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) =>
          previous.movieDetail.overview != current.movieDetail.overview ||
          previous.overviewStatus != current.overviewStatus,
      builder: (context, state) {
        final overview = state.movieDetail.overview;
        if (overview.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final span = TextSpan(
                text: overview,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(height: 1.5, color: greyishTwo),
              );
              final textPainter = TextPainter(
                text: span,
                maxLines: _maxLines,
                textDirection: TextDirection.rtl,
              );
              textPainter.layout(maxWidth: constraints.maxWidth);
              switch (state.overviewStatus) {
                case MovieDetailOverviewStatus.initial:
                case MovieDetailOverviewStatus.collapsed:
                  if (textPainter.didExceedMaxLines) {
                    return _CollapseMode(overview: overview);
                  } else {
                    return _NormalMode(overview: overview);
                  }
                default:
                  if (textPainter.didExceedMaxLines) {
                    return _ExpandMode(overview: overview);
                  } else {
                    return _NormalMode(overview: overview);
                  }
              }
            },
          ),
        );
      },
    );
  }
}

class _NormalMode extends StatelessWidget {
  const _NormalMode({Key? key, required this.overview}) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Text(
      overview,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(height: 1.4, color: greyishTwo),
    );
  }
}

class _CollapseMode extends StatelessWidget {
  const _CollapseMode({Key? key, required this.overview}) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          overview,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(height: 1.4, color: greyishTwo),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              onTap: () {
                const expandEvent = MovieDetailOverviewStatusChanged(
                    MovieDetailOverviewStatus.expanded);
                context.read<MovieDetailBloc>().add(expandEvent);
              },
              child: Text(
                S.current.movie_detail_view_more,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(height: 1.4, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpandMode extends StatelessWidget {
  const _ExpandMode({Key? key, required this.overview}) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overview,
          style: textTheme.bodyText2?.copyWith(height: 1.5, color: greyishTwo),
        ),
        InkWell(
          onTap: () {
            const collapseEvent = MovieDetailOverviewStatusChanged(
              MovieDetailOverviewStatus.collapsed,
            );
            context.read<MovieDetailBloc>().add(collapseEvent);
          },
          child: SizedBox(
            width: double.infinity,
            child: Text(
              S.current.movie_detail_less,
              style: textTheme.bodyText2
                  ?.copyWith(height: 1.5, fontWeight: FontWeight.w500),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
