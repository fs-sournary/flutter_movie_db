import 'package:flutter/material.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_sliver_app_bar_delegate.dart';
import 'package:flutter_movie_db/screen/movie/widget/now_playing_movie_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/popular_movie_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/top_rated_movie_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/upcoming_movie_list.dart';

class MoviePage extends StatelessWidget {
  static const name = '/movie';

  static Route route() => MaterialPageRoute(
        builder: (context) => const MoviePage(),
      );

  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt<MovieBloc>()..add(const MovieCategoryFetched()),
        child: const _View(),
      );
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MovieSliverAppBarDelegate(
              statusBarHeight: MediaQuery.of(context).viewPadding.top,
            ),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildNowPlayingTitle(),
                const NowPlayingMovieList(),
                _buildPopularTitle(),
                const PopularMovieList(),
                _buildTopRatedTitle(),
                const TopRatedMovieList(),
                _buildUpComingTitle(),
                const UpcomingMovieList(),
              ],
            ),
          ),
        ],
      );

  Widget _buildNowPlayingTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 8, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.current.home_now_playing_title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(S.current.home_view_all_action),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.current.home_popular_title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(S.current.home_view_all_action),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRatedTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.current.home_top_rated_title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(S.current.home_view_all_action),
          ),
        ],
      ),
    );
  }

  Widget _buildUpComingTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              S.current.home_upcoming_title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(S.current.home_view_all_action),
          ),
        ],
      ),
    );
  }
}
