import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/extension/context_extension.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_list_of_category.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_now_playing_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_now_playing_list_title.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_popular_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_popular_list_title.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_selected_detail.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_sliver_app_bar_delegate.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_top_rated_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_top_rated_list_title.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_upcoming_list.dart';
import 'package:flutter_movie_db/screen/movie/widget/movie_upcoming_list_title.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const MoviePage(),
      );

  static const name = '/movie';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return getIt<MovieBloc>()
          ..add(const MovieLatestFetched())
          ..add(const MovieNowPlayingFetched())
          ..add(const MovieTopRatedFetched())
          ..add(const MoviePopularFetched())
          ..add(const MovieUpcomingFetched());
      },
      child: context.isMobile ? const _MobileLayout() : const _LargeLayout(),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                const MovieNowPlayingListTitle(),
                const NowPlayingMovieList(),
                const MoviePopularListTitle(),
                const MoviePopularList(),
                const MovieTopRatedListTitle(),
                const MovieTopRatedList(),
                const MovieUpcomingListTitle(),
                const MovieUpcomingList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LargeLayout extends StatelessWidget {
  const _LargeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: MovieSelectedDetail(),
          flex: 7,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: BlocBuilder<MovieBloc, MovieState>(
            buildWhen: (previous, current) =>
                previous.selectedCategoryType != current.selectedCategoryType,
            builder: (context, state) {
              return MovieListOfCategory(type: state.selectedCategoryType);
            },
          ),
          flex: 5,
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
