import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_app_bar_delegate.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_cast_list.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_casts_title.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_genre_list.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_homepage.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_more_information_title.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_overview.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_rating_and_time.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_spoken_language_list.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_spoken_language_title.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_tagline.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_title.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_similar_list.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_similar_list_title.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  static const empty = MovieDetailPage(movieId: 1);

  final int movieId;

  static Route route(int movieId) => MaterialPageRoute(
        builder: (_) => MovieDetailPage(movieId: movieId),
      );

  static const name = "/movie_detail";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailBloc>()
        ..add(MovieDetailFetched(movieId))
        ..add(MovieDetailImagesFetched(movieId))
        ..add(MovieDetailSimilarMoviesFetched(movieId))
        ..add(MovieDetailCastsAndCrewsFetched(movieId)),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MovieDetailAppBarDelegate(
                statusBarHeight: MediaQuery.of(context).viewPadding.top,
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const MovieDetailTitle(),
                  const MovieDetailRatingAndTime(),
                  const MovieDetailTagline(),
                  const MovieDetailGenreList(),
                  const MovieDetailOverview(),
                  const MovieDetailHomePage(),
                  const MovieDetailSimilarListTitle(),
                  MovieDetailSimilarList(movieId: movieId),
                  const MovieDetailCastsTitle(),
                  const MovieDetailCastList(),
                  const MovieDetailMoreInformationTitle(),
                  const MovieDetailSpokenLanguageTitle(),
                  const MovieDetailSpokenLanguageList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
