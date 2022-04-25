import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/model/movie_detail.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailGenreList extends StatelessWidget {
  const MovieDetailGenreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.genres != current.movieDetail.genres;
      },
      builder: (context, state) {
        final genres = state.movieDetail.genres;
        if (genres.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Wrap(
            children: List<Widget>.generate(
              genres.length,
              (index) => _Item(genre: genres[index]),
            ),
            spacing: 8,
            runSpacing: 12,
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.genre}) : super(key: key);

  final MovieDetailGenre genre;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return (previous.selectedGenre == genre ||
                current.selectedGenre == genre) &&
            previous.selectedGenre != current.selectedGenre;
      },
      builder: (context, state) {
        return FilterChip(
          label: Text(genre.name),
          onSelected: (isSelected) {
            context
                .read<MovieDetailBloc>()
                .add(MovieDetailGenreSelected(genre));
          },
          selected: state.selectedGenre == genre,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
    );
  }
}
