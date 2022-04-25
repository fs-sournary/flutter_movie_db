import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';

class HomeMovieCategoryList extends StatelessWidget {
  const HomeMovieCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.movieType != current.movieType,
      builder: (context, state) {
        final type = state.movieType;
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final indexType = MovieCategoryType.values[index];
            return ListTile(
              leading: const Icon(Icons.folder_open),
              title: Text(_getTitle(indexType)),
              selected: type == indexType,
              onTap: () => context
                  .read<HomeBloc>()
                  .add(HomeMovieCategoryChanged(indexType)),
              style: ListTileStyle.drawer,
            );
          },
          itemCount: MovieCategoryType.values.length,
        );
      },
    );
  }

  String _getTitle(MovieCategoryType type) {
    switch (type) {
      case MovieCategoryType.latest:
        return S.current.home_latest_title;
      case MovieCategoryType.nowPlaying:
        return S.current.home_now_playing_title;
      case MovieCategoryType.popular:
        return S.current.home_popular_title;
      case MovieCategoryType.topRated:
        return S.current.home_top_rated_title;
      default:
        return S.current.home_upcoming_title;
    }
  }
}
