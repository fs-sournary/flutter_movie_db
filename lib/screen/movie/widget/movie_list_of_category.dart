import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/model/movie_category_type.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/widget/custom_network_image.dart';
import 'package:flutter_movie_db/widget/hover_button.dart';
import 'package:flutter_movie_db/widget/rating_bar.dart';

class MovieListOfCategory extends StatefulWidget {
  const MovieListOfCategory({Key? key, required this.type}) : super(key: key);

  final MovieCategoryType type;

  @override
  State<MovieListOfCategory> createState() => _MovieListOfCategoryState();
}

class _MovieListOfCategoryState extends State<MovieListOfCategory> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) {
        switch (widget.type) {
          case MovieCategoryType.latest:
            return previous.latestMovies != current.latestMovies;
          case MovieCategoryType.nowPlaying:
            return previous.nowPlayingMovies != current.nowPlayingMovies;
          case MovieCategoryType.popular:
            return previous.popularMovies != current.popularMovies;
          case MovieCategoryType.topRated:
            return previous.topRatedMovies != current.topRatedMovies;
          case MovieCategoryType.upcoming:
            return previous.upcomingMovies != current.upcomingMovies;
        }
      },
      builder: (context, state) {
        var movies = <CategoryMovie>[];
        var isReachMax = false;
        switch (widget.type) {
          case MovieCategoryType.latest:
            movies.addAll(state.latestMovies);
            isReachMax = state.isLatestMoviesReachMax;
            break;
          case MovieCategoryType.nowPlaying:
            movies.addAll(state.nowPlayingMovies);
            isReachMax = state.isNowPlayingMoviesReachMax;
            break;
          case MovieCategoryType.popular:
            movies.addAll(state.popularMovies);
            isReachMax = state.isPopularMoviesReachMax;
            break;
          case MovieCategoryType.topRated:
            movies.addAll(state.topRatedMovies);
            isReachMax = state.isTopRatedMoviesReachMax;
            break;
          case MovieCategoryType.upcoming:
            movies.addAll(state.upcomingMovies);
            isReachMax = state.isUpcomingMoviesReachMax;
            break;
        }
        return ListView.separated(
          padding: const EdgeInsets.only(top: 48),
          itemBuilder: (context, index) {
            if (index >= movies.length) {
              return const _Loader();
            }
            final movie = movies[index];
            return _Item(
              onItemClicked: () {},
              item: movie,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: isReachMax ? movies.length : movies.length + 1,
          controller: _scrollController,
        );
      },
    );
  }

  void _onScroll() {
    if (!_isBottom) return;
    switch (widget.type) {
      case MovieCategoryType.latest:
        context.read<MovieBloc>().add(const MovieLatestFetched());
        break;
      case MovieCategoryType.nowPlaying:
        context.read<MovieBloc>().add(const MovieNowPlayingFetched());
        break;
      case MovieCategoryType.topRated:
        context.read<MovieBloc>().add(const MovieTopRatedFetched());
        break;
      case MovieCategoryType.popular:
        context.read<MovieBloc>().add(const MoviePopularFetched());
        break;
      case MovieCategoryType.upcoming:
        context.read<MovieBloc>().add(const MovieUpcomingFetched());
        break;
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll == maxScroll;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.onItemClicked,
    required this.item,
  }) : super(key: key);

  final VoidCallback onItemClicked;
  final CategoryMovie item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final voteAverage = item.voteAverage;
    final releaseDate = item.releaseDate;
    final overview = item.overview;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: colorScheme.surface.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomNetworkImage(
                path: item.posterPath,
                width: 40,
                height: 40,
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          if (voteAverage != 0)
                            Text(
                              voteAverage.toString(),
                              style:
                                  textTheme.bodyText2?.copyWith(fontSize: 12),
                            ),
                          if (voteAverage != 0)
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              child: RatingBar(rating: voteAverage),
                            ),
                          if (voteAverage != 0 && releaseDate.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(S.current.dot_separator),
                            ),
                          if (releaseDate.isNotEmpty)
                            Text(
                              releaseDate,
                              style:
                                  textTheme.bodyText2?.copyWith(fontSize: 12),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              HoverButton(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.star_border),
                  ),
                ),
                shape: BoxShape.circle,
                hoverColor: colorScheme.onSurface,
              ),
            ],
          ),
          if (overview.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Text(
                overview,
                style: textTheme.bodyMedium?.copyWith(height: 1.4),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
