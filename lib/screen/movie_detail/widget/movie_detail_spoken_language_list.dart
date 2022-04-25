import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';

class MovieDetailSpokenLanguageList extends StatelessWidget {
  const MovieDetailSpokenLanguageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.movieDetail.spokenLanguages !=
            current.movieDetail.spokenLanguages;
      },
      builder: (context, state) {
        final spokenLanguages = state.movieDetail.spokenLanguages;
        if (spokenLanguages.isEmpty) {
          return Container();
        }
        return Container(
          margin: const EdgeInsets.only(left: 16, top: 4, right: 16),
          child: Wrap(
            children: List<Widget>.generate(
              spokenLanguages.length,
              (index) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (index != 0)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(S.current.dot_separator),
                    ),
                  Text(
                    spokenLanguages[index].englishName,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
