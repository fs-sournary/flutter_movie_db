import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/model/similar_movies.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/utils/constants.dart';
import 'package:flutter_movie_db/widget/rating_bar.dart';

class MovieDetailSimilarList extends StatefulWidget {
  const MovieDetailSimilarList({Key? key, required this.movieId})
      : super(key: key);

  final int movieId;

  @override
  State<MovieDetailSimilarList> createState() => _MovieDetailSimilarListState();
}

class _MovieDetailSimilarListState extends State<MovieDetailSimilarList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        final movies = state.similarMovies;
        final hasReachedMax = state.hasSimilarMoviesReachedMax;
        return SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemBuilder: (context, index) {
              if (index >= movies.length) {
                return const _Loader();
              }
              return _Item(
                onItemClicked: (movieId) {},
                item: movies[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: hasReachedMax ? movies.length : movies.length + 1,
            controller: _scrollController,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context
          .read<MovieDetailBloc>()
          .add(MovieDetailSimilarMoviesFetched(widget.movieId));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll == maxScroll;
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.onItemClicked,
    required this.item,
  }) : super(key: key);

  final Function(int) onItemClicked;
  final SimilarMovie item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemClicked.call(item.id),
      child: SizedBox(
        width: 160,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 2.0,
          child: Column(
            children: [
              Expanded(child: _buildAvatar()),
              _buildTitle(context),
              _buildVoteAverage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: Image.network(baseApiImage + item.posterPath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildVoteAverage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
      child: Row(
        children: [
          Text(
            item.voteAverage.toString(),
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4),
              child: RatingBar(rating: item.voteAverage),
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
